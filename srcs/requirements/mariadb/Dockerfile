FROM debian:buster

WORKDIR ./server_dir/

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y default-mysql-server wget

EXPOSE 3306

COPY db.sh /var/www/

RUN chmod +x /var/www/db.sh

ENTRYPOINT ["/var/www/db.sh"]

CMD ["mysqld"]