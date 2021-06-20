#!/usr/bin/env bash

mkdir /etc/apache2/ssl_keys/

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -sha256 \
   		-subj "/C=RU/ST=Ivanovo/L=Ivanovo/O=Guru Project/OU=Research" \
   		-keyout /etc/apache2/ssl_keys/server.key  -out /etc/apache2/ssl_keys/server.crt

mkdir -p /var/run/apache2/

chown -R root:root /etc/apache2/ssl_keys/
chmod -R 600 /etc/apache2/ssl_keys/
exec "$@"
