#!/usr/bin/env bash
#sed -i "s/bind-ad/\#bind-ad" "/etc/mysql/mariadb.conf.d/50-server.cnf"
#sed -i "s/\#port /port /" "etc/mysql/mariadb.conf.d/50-server.cnf"
chown -R root:root /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

#  mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql


#echo "Creating WP DB"

if [ ! -f /server_dir/50-server.cnf ]; then
  service mysql start
  mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE"
  mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
  mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'"
  mysql -u root -e "FLUSH PRIVILEGES"
  mysqladmin -u root password $MYSQL_ROOT_PASSWORD
  service mysql stop
else
  mv /server_dir/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
  mkdir /var/run/mysqld
  mkfifo /var/run/mysqld/mysqld.sock
  touch /var/run/mysqld/mysqld.pid
#  mkfifo /var/run/mysqld/mysqld.sock
#  touch /var/run/mysqld/mysqld.pid
fi
  chown -R mysql /var/run/mysqld

exec "$@"
