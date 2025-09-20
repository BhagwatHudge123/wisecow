# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/usr/games:${PATH}"

# Set the working directory in the container
WORKDIR /app

# Update package list and install dependencies
RUN apt-get update \
    && apt-get install -y \
    netcat \
    fortune-mod \
    cowsay \
    bash \
    && echo "Successfully installed cowsay and fortune-mod" \
    && which fortune \
    && which cowsay \
    && rm -rf /var/lib/apt/lists/*

# Copy your script into the container
COPY wisecow.sh /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh \
    && echo "Script is now executable" \
    && ls -l /app/wisecow.sh

# Set entrypoint to bash
ENTRYPOINT ["/bin/bash"]
