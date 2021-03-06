#!/usr/bin/env bash

mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

sed -i "s/supervised no/supervised systemd/" "/etc/redis/redis.conf"
sed -i "s/#maxmemory/maxmemory 128M/" "/etc/redis/redis.conf"
sed -i "s/#maxmemory-policy noeviction/maxmemory-policy allkeys-lfu/" "/etc/redis/redis.conf"
sed -i "s/bind 127.0.0.1 ::1/bind 0.0.0.0/" "/etc/redis/redis.conf"

sleep 40

if [ ! -d /var/www/html/wordpress/wp-content/plugins/redis_cache/ ]; then
  cd /var/www/html/wordpress/

  wp plugin install --allow-root redis-cache
  wp plugin activate --allow-root redis-cache
fi
  service redis-server start
exec "$@"