#!/usr/bin/env bash
#sed -i "s/listen = \/run/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
sed -i "s/supervised no/supervised systemd/" "/etc/redis/redis.conf"
  mkdir -p /run/php/
  touch /run/php/php7.3-fpm.pid

if [ ! -d /var/www/html/wordpress ]; then
  cd /var/www/html && \
  wget https://wordpress.org/latest.tar.gz && \
	tar -xvzf latest.tar.gz && rm -rf latest.tar.gz && \
	cp /server_dir/wp-config.php ./wordpress/
fi
  chown -R www-data:www-data /var/www/html/*
  chmod -R 755 /var/www/html/*
service redis-server start
exec "$@"