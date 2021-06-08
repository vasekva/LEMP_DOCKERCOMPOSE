FROM debian:buster

WORKDIR ./server_dir/

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y php-fpm php-mysql php-mbstring php-gd redis-server php-redis php-xml wget nano

EXPOSE 9000

# COPY ./conf/ /var/www/
COPY ./conf/ .

# RUN mkdir -p /var/www/html/

RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xvzf latest.tar.gz && rm -rf latest.tar.gz && \
	cp wp-config.php wordpress/ && \
	mv wordpress /var/www/html/wordpress

RUN mv www.conf /etc/php/7.3/fpm/pool.d/www.conf
# RUN  mv www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chmod +x wp_old.sh

ENTRYPOINT [ "bash", "wp_old.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]