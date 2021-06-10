# ALTER USER 'root'@'localhost' IDENTIFIED BY 'cool42';
# CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
# CREATE USER IF NOT EXISTS 'jberegon'@'%' identified by 'cool21';
# GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO 'jberegon'@'%';
# FLUSH PRIVILEGES;
CREATE DATABASE wp;
CREATE USER 'user'@'localhost' identified by 'password';
GRANT ALL PRIVILEGES ON wp.* TO 'user'@'localhost';