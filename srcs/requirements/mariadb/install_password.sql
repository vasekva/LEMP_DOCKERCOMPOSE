use mysql;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
flush privileges;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* to '$MYSQL_USER'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;