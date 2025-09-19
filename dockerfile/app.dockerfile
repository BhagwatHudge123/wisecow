FROM debian:stable-slim

# Install necessary dependencies
RUN apt-get update -o Debug::pkgProblemResolver=true -o Dpkg::Progress-Fancy="1" && apt-get install -y \
    apt-transport-https \
    netcat \
    fortune-mod \
    cowsay \
    bash \
  && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy script file to /app directory
COPY wisecow.sh /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Expose port
EXPOSE 4499

# command to execute the script
CMD ["/bin/bash", "/app/wisecow.sh"]
