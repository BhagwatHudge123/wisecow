#!/usr/bin/env bash
 
SRVPORT=4499
 
prerequisites() {
    command -v cowsay >/dev/null 2>&1 &&
    command -v fortune >/dev/null 2>&1 &&
    command -v nc >/dev/null 2>&1 || {
        echo "Install cowsay, fortune, and nc first."
        exit 1
    }
}
 
handleRequest() {
    mod=$(fortune)
    {
        echo -e "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n"
        echo "<pre>"
        cowsay "$mod"
        echo "</pre>"
    }
}
 
main() {
    prerequisites
    echo "Wisdom served on port=$SRVPORT..."
 
    # Listen on all interfaces (-k = keep open, -p = port)
    while true; do
        handleRequest | nc -l -p $SRVPORT -q 1
    done
}
 
main
