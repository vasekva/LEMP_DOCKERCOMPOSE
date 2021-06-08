#!/bin/sh

openrc default
etc/init.d/mariadb setup
rm -R /var/lib/mysql/*
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
rc-service mariadb start
mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES"
rc-service mariadb stop
exec /usr/bin/mysqld_safe --datadir='/var/lib/mysql' -u root