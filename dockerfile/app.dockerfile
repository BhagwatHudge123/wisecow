# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install required packages
RUN apt-get update && apt-get install -y \
    netcat \
    fortune \
    cowsay \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Set working directory to /app
WORKDIR /app

# Copy the script into the container
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

# Expose port 4499 
EXPOSE 4499

# Run the script when the container starts
CMD ["/bin/bash", "/app/wisecow.sh"]
