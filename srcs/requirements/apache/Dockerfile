FROM debian:buster

WORKDIR ./server_dir/

COPY ./ ./

RUN apt-get update
RUN apt-get install apache2 openssl -y
RUN a2enmod ssl
RUN mkdir -p /var/lock/apache2
RUN mkdir -p /var/run/apache2

ADD default /etc/apache2/sites-available/000-default.conf

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV LANG C

EXPOSE 443

ENTRYPOINT [ "bash", "start.sh" ]

CMD ["/usr/sbin/apache2","-D","FOREGROUND"]