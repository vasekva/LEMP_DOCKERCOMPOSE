#!/usr/bin/env bash
mv /server_dir/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
chown -R mysql:mysql /var/lib/mysql
chmod 755 -R /var/lib/mysql

#service mysql start
#
#  mysql -e "CREATE DATABASE IF NOT EXISTS $DATABASE;"
#  mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
#  mysql -e "GRANT ALL PRIVILEGES ON $DATABASE.* TO '$DB_USER'@'%';"
#  mysql -u root -e "DELETE FROM mysql.user WHERE User='';"
#  mysql -u root -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
#  mysql -u root -e "DROP DATABASE IF EXISTS test;"
#  mysql -u root -e "DELETE FROM mysql.user WHERE Password='';"
#  service mysql stop

#  echo "five"
#  mysql -u root -e "FLUSH PRIVILEGES;"
#  mkfifo /var/run/mysqld/mysqld.sock
#  touch /var/run/mysqld/mysqld.pidc

#  bash ./secure.sh
#  echo "& y y root root y y y y" | mysql_secure_installation


#chown -R root:root /var/lib/mysql
#chgrp -R mysql /var/lib/mysql
#
if [ ! -d /var/lib/mysql/wp ]; then
  mysql_install_db --user=mysql --ldata=/var/lib/mysql
  service mysql start
#  mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DATABASE"
  mysql -u root -e "CREATE DATABASE IF NOT EXISTS wp"
#  mysql -u root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'"
  mysql -u root -e "CREATE USER IF NOT EXISTS 'jberegon'@'%' IDENTIFIED BY 'dbpass'"
#  mysql -u root -e "GRANT ALL PRIVILEGES ON $DATABASE.* TO '$DB_USER'@'%'"
  mysql -u root -e "GRANT ALL PRIVILEGES ON wp.* TO 'jberegon'@'%'"
  mysql -u root -e "DELETE FROM mysql.user WHERE User='';"
  mysql -u root -e "DELETE FROM mysql.user WHERE Password='';"
#  mysql -u root -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
  mysql -u root -e "DROP DATABASE IF EXISTS test;"
  mysql -u root -e "FLUSH PRIVILEGES"
  echo "STOP"
  #service mysql stop -u root -p $DB_ROOT_PASSWORD
  service mysql stop
else
  mkdir -p /var/run/mysqld
  if [ ! -f /var/run/mysqld/mysqld.sock ]; then
    mkfifo /var/run/mysqld/mysqld.sock
  fi
  touch /var/run/mysqld/mysqld.pid
fi
  chown -R mysql /var/run/mysqld
#
echo "FINAL"
exec "$@"