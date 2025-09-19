FROM debian:stable-slim

# Install necessary packages and clean up cache
RUN apt-get update && apt-get install -y \
    netcat \
    fortune-mod \
    cowsay \
    bash \
  && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy script file to /app directory
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

# Expose port 
EXPOSE 4499

# Set command to execute the script
CMD ["/bin/bash", "/app/wisecow.sh"]
