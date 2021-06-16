FROM debian:buster

WORKDIR ./server_dir/

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y php-fpm php-mysql php-mbstring php-gd php-xml \
	wget

#RUN apt-get install php-redis redis-server

EXPOSE 9000

COPY ./conf/ .
COPY ./tools/ .

RUN mv www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chmod +x wp.sh

ENTRYPOINT [ "bash", "wp.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]