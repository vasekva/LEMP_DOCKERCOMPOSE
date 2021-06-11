#!/bin/sh

mkdir /etc/nginx/ssl/

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -sha256 \
   		-subj "/C=RU/ST=Ivanovo/L=Ivanovo/O=Guru Project/OU=Research" \
   		-keyout /etc/nginx/ssl/private.key -out /etc/nginx/ssl/certificate.crt

if [ -f /server_dir/default ]; then
  mv /server_dir/default /etc/nginx/sites-available/default
fi
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
#????
chown -R root:root /etc/nginx/ssl/
chmod -R 600 /etc/nginx/ssl/
# Startup the cmd
exec "$@"