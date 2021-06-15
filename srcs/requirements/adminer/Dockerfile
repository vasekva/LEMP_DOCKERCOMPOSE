FROM debian:buster

WORKDIR ./host_tools_dir/

COPY ./start.sh .

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y adminer wget php-fpm php-mysql

EXPOSE 8080

ENTRYPOINT [ "bash", "start.sh"]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]

#ENTRYPOINT ["/usr/sbin/apache2", "-k", "start"]


#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
#ENV APACHE_LOG_DIR /var/log/apache2
#
#EXPOSE 80
#CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
#COPY ./start.sh .
#COPY ./www.conf .

# add adminer as the only nginx site
#ADD adminer.nginx.conf /etc/nginx/sites-available/adminer
#RUN ln -s /etc/nginx/sites-available/adminer /etc/nginx/sites-enabled/adminer
#RUN rm /etc/nginx/sites-enabled/default

# install adminer and default theme
#RUN mkdir /var/www
#RUN wget http://www.adminer.org/latest.php -O /var/www/index.php
#RUN wget https://raw.github.com/vrana/adminer/master/designs/hever/adminer.css -O /var/www/adminer.css
#WORKDIR /var/www
#RUN chown www-data:www-data -R /var/www

# tune PHP settings for uploading large dumps

# expose only nginx HTTP port
#EXPOSE 80
#RUN mv www.conf /etc/php/7.3/fpm/pool.d/www.conf

#ADD freetds.conf /etc/freetds/freetds.conf

#ENTRYPOINT [ "bash", "start.sh" ]


#ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
#CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
#CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]