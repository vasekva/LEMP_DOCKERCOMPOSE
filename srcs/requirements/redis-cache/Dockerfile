FROM debian:buster

WORKDIR ./server_dir/

COPY ./tools .

RUN apt-get update && apt-get install wget redis-server -y


EXPOSE 6379
#  mv /server_dir/object-cache.php /var/www/html/wordpress/wp-content/

ENTRYPOINT [ "bash", "redis_start.sh" ]

#CMD [""]