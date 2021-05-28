FROM php:8.0-fpm

WORKDIR /my_own_server

RUN apt-get update && apt-get upgrade -y && \
	apt-get install wget -y

COPY . .

RUN mkdir -p /var/www/html/my_own_server

RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xvzf latest.tar.gz && rm -rf latest.tar.gz && \
	cp wp-config.php wordpress/ && \
	mv wordpress /var/www/html/my_own_server/wordpress