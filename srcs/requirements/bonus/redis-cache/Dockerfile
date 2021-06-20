FROM debian:buster

WORKDIR ./tools_dir/

COPY ./tools .

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y php-fpm php-mysql php-mbstring php-gd php-xml \
	wget redis-server php-redis

EXPOSE 6379

ENTRYPOINT [ "bash", "redis_start.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]