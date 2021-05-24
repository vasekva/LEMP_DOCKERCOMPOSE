FROM debian:buster

WORKDIR ./my_own_server

RUN apt-get update && apt-get upgrade -y && \
	apt-get install nginx -y

COPY ./tools/ .

RUN mkdir /var/www/html/my_own_server

EXPOSE 80 443

CMD bash start_nginx.sh