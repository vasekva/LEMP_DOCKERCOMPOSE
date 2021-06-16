#!/bin/sh

sleep 20

# Replace the hostname in the container
# sed -i.bak 's/HOSTNAME/'"$HOSTNAME"'/g' /www/data/index.html

mkdir /etc/nginx/ssl/
#rm -rf /etc/nginx/sites-available/default
#rm -rf /etc/nginx/sites-enabled/default
#ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/server
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -sha256 \
   		-subj "/C=RU/ST=Ivanovo/L=Ivanovo/O=Guru Project/OU=Research" \
   		-keyout /etc/nginx/ssl/private.key -out /etc/nginx/ssl/certificate.crt

if [ -f /server_dir/default ]; then
#  mv /server_dir/nginx.conf /etc/nginx/sites-available/default
  mv /server_dir/default /etc/nginx/sites-available/default
fi
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
#????
chown -R root:root /etc/nginx/ssl/
chmod -R 600 /etc/nginx/ssl/
# Startup the cmd
exec "$@"