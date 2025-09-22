FROM --platform=linux/amd64 ubuntu:20.04

ENV PATH="/usr/games:${PATH}"

WORKDIR /app

# Update package list and install dependencies
RUN apt-get update \
    && apt-get install -y \
    netcat \
    fortune-mod \
    cowsay \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Copy app code
COPY wisecow.sh /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh \
     && ls -l /app/wisecow.sh

# Set entrypoint
ENTRYPOINT ["/bin/bash"]
