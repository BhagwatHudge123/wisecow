FROM debian:stable

# Ensure the system is up to date and install curl for network checks
RUN apt-get update && apt-get install -y \
    curl \
    apt-transport-https \
    gnupg2 \
    ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    netcat \
    fortune-mod \
    cowsay \
    bash \
  && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy the script file to the /app directory
COPY wisecow.sh /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Expose port 4499
EXPOSE 4499

# Set the default command to execute the script
CMD ["/bin/bash", "/app/wisecow.sh"]
