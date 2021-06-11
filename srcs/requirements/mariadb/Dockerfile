FROM debian:buster

WORKDIR ./server_dir/

COPY ./conf/ .
COPY ./tools/db.sh .

RUN apt-get update && apt-get upgrade -y && \
    apt-get install mariadb-server -y

CMD bash mysql_secure.sh

EXPOSE 3306

COPY tools/db.sh /var/www/

RUN chmod +x /var/www/db.sh

ENTRYPOINT ["/var/www/db.sh"]

CMD ["mysqld"]