#!/bin/sh

# Replace the hostname in the container
sed -i.bak 's/HOSTNAME/'"$HOSTNAME"'/g' /www/data/index.html

mkdir /etc/nginx/ssl/
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
   		-subj "/C=RU/ST=Ivanovo/L=Ivanovo/O=Guru Project/OU=Research" \
   		-keyout /etc/nginx/ssl/private.key -out /etc/nginx/ssl/certificate.crt

chown -R root:root /etc/nginx/ssl/
chmod -R 600 /etc/nginx/ssl/
# Startup the cmd
exec "$@"