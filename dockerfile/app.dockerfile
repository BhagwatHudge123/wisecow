FROM debian:stable

# Change repository mirror to a different one
RUN sed -i 's#http://deb.debian.org#http://ftp.debian.org#' /etc/apt/sources.list

# Test network connectivity (you can comment this out if you don’t need it)
RUN apt-get update && apt-get install -y curl && curl -I https://deb.debian.org

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    netcat \
    fortune-mod \
    cowsay \
    bash && \
    rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy script file to /app directory
COPY wisecow.sh /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Expose port 4499
EXPOSE 4499

# Set the default command to execute the script
CMD ["/bin/bash", "/app/wisecow.sh"]
