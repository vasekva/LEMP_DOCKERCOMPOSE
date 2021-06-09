FROM debian:buster

WORKDIR ./server_dir/

COPY . .

RUN apt-get update && apt-get upgrade -y && \
    apt-get install mariadb-server -y

# CMD systemctl start mariadb
# CMD mysql_secure_installation
CMD bash mysql_secure.sh

EXPOSE 3306

COPY db.sh /var/www/

RUN chmod +x /var/www/db.sh

#RUN mv 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# RUN mv mySQL.cnf /etc/mysql/conf.d/

ENTRYPOINT ["/var/www/db.sh"]

CMD ["mysqld"]