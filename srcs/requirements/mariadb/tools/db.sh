#!/usr/bin/env bash
mv /tools_dir/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
chown -R mysql:mysql /var/lib/mysql
chmod 755 -R /var/lib/mysql

if [ ! -d /var/lib/mysql/wp ]; then
  mysql_install_db --user=mysql --ldata=/var/lib/mysql
  service mysql start
  mysql < create_db.sql
else
  mkdir -p /var/run/mysqld
  if [ ! -f /var/run/mysqld/mysqld.sock ]; then
    mkfifo /var/run/mysqld/mysqld.sock
  fi
  touch /var/run/mysqld/mysqld.pid
fi
  chown -R mysql /var/run/mysqld
exec "$@"