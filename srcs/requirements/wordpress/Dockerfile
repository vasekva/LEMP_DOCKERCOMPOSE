FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y php-fpm php-mysql php-mbstring php-gd redis-server php-redis php-xml wget nano

EXPOSE 9000

COPY ./conf/ /var/www/

RUN chmod +x /var/www/wp.sh
ENTRYPOINT ["/var/www/wp.sh"]
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]