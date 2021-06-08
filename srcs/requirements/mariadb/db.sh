#!/usr/bin/env bash
#sed -i "s/bind-ad/\#bind-ad" "/etc/mysql/mariadb.conf.d/50-server.cnf"
#sed -i "s/\#port /port /" "etc/mysql/mariadb.conf.d/50-server.cnf"
chown -R mysql:mysql /var/lib/mysql
#chown -R root:root /var/lib/mysql

echo "Creating WP DB"
if [ ! -d /var/lib/mysql/wp ]; then
#  mkdir -p /var/run/mysqld
#  mkfifo /var/run/mysqld/mysqld.sock
#  touch /var/run/mysqld/mysqld.pid
#  chown -R mysql /var/run/mysqld
  service mysql start
#  mysql -u root -h 127.0.0.1 -p -P 3306
#  mysql < create_new_user.sql
#  mysqladmin -u root password $MYSQL_ROOT_PASSWORD
#  mysql -u root -pnewpassword
#  mysql -u root -e "SET PASSWORD FOR root@'localhost' = PASSWORD('cool42');"
#  mysql -u root -p
#  systemctl restart mysql
  mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE"
  mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
  mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'"
  mysql -u root -e "FLUSH PRIVILEGES"
  mysqladmin -u root password $MYSQL_ROOT_PASSWORD
  service mysql stop
else
  mkdir /var/run/mysqld
  mkfifo /var/run/mysqld/mysqld.sock
  touch /var/run/mysqld/mysqld.pid
fi
#  mkdir /var/run/mysqld
#  mkfifo /var/run/mysqld/mysqld.sock
#  touch /var/run/mysqld/mysqld.pid
  chown -R mysql /var/run/mysqld
#  service mysql stop

  exec "$@"
