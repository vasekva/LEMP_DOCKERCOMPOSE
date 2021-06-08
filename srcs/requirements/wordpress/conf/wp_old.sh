#!/usr/bin/env bash
#sed -i "s/listen = \/run/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
sed -i "s/supervised no/supervised systemd/" "/etc/redis/redis.conf"
  mkdir -p /run/php/
  touch /run/php/php7.3-fpm.pid
  chown -R www-data:www-data /var/www/*
  chmod -R 755 /var/www/*

#if [ ! -f /var/www/html/wp-config.php ]; then
#  mkdir -p /var/www/html/
#  wget https://wordpress.org/latest.tar.gz && \
#	tar -xvzf latest.tar.gz && rm -rf latest.tar.gz && \
#	cp wp-config.php wordpress/ && \
#	mv wordpress /var/www/html/wordpress
#fi
service redis-server start
exec "$@"