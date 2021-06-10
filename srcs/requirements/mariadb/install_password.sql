use mysql;
UPDATE user SET password=PASSWORD("<your password>") where User = 'root';
GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY '<your password>';
GRANT TRIGGER ON *.* TO root@'%' IDENTIFIED BY '<your password>';
GRANT SUPER ON *.* TO root@'%' IDENTIFIED BY '<your password>';
FLUSH PRIVILEGES