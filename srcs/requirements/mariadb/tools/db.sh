#!/usr/bin/env bash
mv /server_dir/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

chown -R root:root /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql
chgrp -R mysql /var/lib/mysql
mysql_install_db --user=mysql --ldata=/var/lib/mysql

if [ ! -d /var/lib/mysql/wp ]; then
  service mysql start
  mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DATABASE"
  mysql -u root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'"
  mysql -u root -e "GRANT ALL PRIVILEGES ON $DATABASE.* TO '$DB_USER'@'%'"
  mysql -u root -e "FLUSH PRIVILEGES"
  mysqladmin -u root password $DB_ROOT_PASSWORD
  echo "STOP"
  #service mysql stop -u root -p $DB_ROOT_PASSWORD
#  service mysql stop
else
  mkdir /var/run/mysqld
  mkfifo /var/run/mysqld/mysqld.sock
  touch /var/run/mysqld/mysqld.pidc
fi
  chown -R mysql /var/run/mysqld

echo "FINAL"
exec "$@"