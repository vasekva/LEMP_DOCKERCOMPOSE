use mysql;
# update user set password=PASSWORD('cool42') where User='root';
flush privileges;
CREATE DATABASE IF NOT EXISTS wp;
CREATE USER 'jberegon'@'%' IDENTIFIED BY 'cool21';
GRANT ALL PRIVILEGES ON wp.* to 'jberegon'@'%' WITH GRANT OPTION;
flush privileges;
