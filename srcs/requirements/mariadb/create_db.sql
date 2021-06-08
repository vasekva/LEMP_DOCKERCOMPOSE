ALTER USER 'root'@'localhost' IDENTIFIED BY 'cool42';
CREATE DATABASE IF NOT EXISTS wp;
CREATE USER IF NOT EXISTS 'jberegon'@'%' identified by 'cool21';
GRANT ALL PRIVILEGES ON wp.* TO 'jberegon'@'%';
FLUSH PRIVILEGES;