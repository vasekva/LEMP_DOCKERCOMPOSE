#!/usr/bin/env bash

sed -i "s/supervised no/supervised systemd/" "/etc/redis/redis.conf"
sed -i "s/#maxmemory/maxmemory 128M/" "/etc/redis/redis.conf"
sed -i "s/#maxmemory-policy noeviction/maxmemory-policy allkeys-lfu/" "/etc/redis/redis.conf"
sed -i "s/bind 127.0.0.1 ::1/bind 0.0.0.0/" "/etc/redis/redis.conf"

sleep 30
if [ ! -d /var/www/html/wordpress/wp-content/plugins/redis_cache/ ]; then
#  mkdir /var/www/html/wordpress
#  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#  chmod +x wp-cli.phar
#  mv wp-cli.phar /usr/local/bin/wp
  cd /var/www/html/wordpress
#  wp core download --allow-root
#  mv /server_dir/wp-config.php /var/www/html/wordpress

  wp plugin install --allow-root redis-cache
  wp plugin activate --allow-root redis-cache

fi
  redis-server --daemonize no
  service redis-server start
#exec "$@"