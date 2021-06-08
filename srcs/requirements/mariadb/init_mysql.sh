#!/usr/bin/env bash
#mysqld_safe --skip-grant-tables --skip-networking
#mysqld_safe --skip-grant-tables --skip-networking
chown -R mysql:mysql /var/lib/mysql
chown -R root:root /var/lib/mysql
  mkdir -p /var/run/mysqld
  touch /var/run/mysqld/mysql.pid
  mkfifo /var/run/mysqld/mysqld.sock
#if [ ! -d var/lib/mysql/wp ]; then
  service mysql start
  mysql < create_db.sql
  echo "DB has been create successfully"
  mysqladmin -u root password $MYSQL_ROOT_PASSWORD
#  service mysql stop
#else
#  mkdir -p /var/run/mysqld
#  touch /var/run/mysqld/mysql.pid
#  mkfifo /var/run/mysqld/mysqld.sock
#fi
#chown -R mysql /var/run/mysqld
#chown -R mysql:mysql /var/lib/mysql
#chown -R root:root /var/lib/mysql
#if [ ! -d var/lib/mysql/wp ]; then
#  service mysql start
#
#  mysql -u root
#
#  mysql < create_new_user.sql
#  service mysql restart
#
#  echo "Creating MYSQL_DB"
#  mysql < create_db.sql
##service mysql stop
#else
#  mkdir -p /var/run/mysqld
#  touch /var/run/mysqld/mysql.pid
#  mkfifo /var/run/mysqld/mysqld.sock
#fi
#  chown mysql: /var/run/mysqld
#
exec "$@"