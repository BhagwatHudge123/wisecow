FROM ubuntu:20.04

# Update package list and install dependencies explicitly, adding debug information
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

# Set working directory to /app
WORKDIR /app

# Copy the script
COPY wisecow.sh /app/wisecow.sh

# Make sure the script is executable and check permissions
RUN chmod +x /app/wisecow.sh \
    && echo "Script is now executable" \
    && ls -l /app/wisecow.sh

# Expose the necessary port
EXPOSE 4499

# Command to run the script
CMD ["/bin/bash", "/app/wisecow.sh"]
