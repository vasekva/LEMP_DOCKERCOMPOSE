FROM debian:buster

WORKDIR ./server_dir/

COPY ./tools .

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y php-fpm php-mysql php-mbstring php-gd php-xml \
	wget redis-server php-redis
EXPOSE 6379
#  mv /server_dir/object-cache.php /var/www/html/wordpress/wp-content/

ENTRYPOINT [ "bash", "redis_start.sh" ]

#CMD [""]