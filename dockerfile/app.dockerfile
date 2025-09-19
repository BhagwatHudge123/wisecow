FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    netcat \
	fortune-mod\
	cowsay \
	bash \
	&& rm -rf /var/lib/apt/list/*
	
# Copy script file to work directory

WORKDIR /app
COPY wisecow.sh	 /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

#expose port
Expose 4499

CMD ["/app.wisecow.sh"]
