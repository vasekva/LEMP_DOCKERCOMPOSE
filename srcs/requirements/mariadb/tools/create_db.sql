CREATE DATABASE IF NOT EXISTS wp;
CREATE USER IF NOT EXISTS 'jberegon'@'%' IDENTIFIED BY 'dbpass';
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON wp.* TO 'jberegon'@'%';
GRANT ALL PRIVILEGES ON wp.* TO 'root'@'%';
DELETE FROM mysql.user WHERE Password='';
DROP DATABASE IF EXISTS test;
FLUSH PRIVILEGES;