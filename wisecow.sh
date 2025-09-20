#!/usr/bin/env bash

SRVPORT=4499

get_api() {
    read line
    echo $line
}

handleRequest() {
    # Process the request
    get_api
    mod=`fortune`

    # Directly respond with cowsay
    echo "HTTP/1.1 200 OK"
    echo "Content-Type: text/html"
    echo ""
    echo "<pre>$(cowsay $mod)</pre>"
}

prerequisites() {
    command -v cowsay >/dev/null 2>&1 &&
    command -v fortune >/dev/null 2>&1 &&
    command -v nc >/dev/null 2>&1 || 
        { 
            echo "Install prerequisites."
            exit 1
        }
}

main() {
    prerequisites
    echo "Wisdom served on port=$SRVPORT..."

    # Listen for connections, respond with handleRequest
    while true; do
        # Handle incoming requests using nc
        nc -lN $SRVPORT | handleRequest
        sleep 0.01
    done
}

main
