#!/usr/bin/env bash

  sed -i "s/supervised no/supervised systemd/" "/etc/redis/redis.conf"
  sed -i "s/#maxmemory/maxmemory 128M/" "/etc/redis/redis.conf"
  sed -i "s/#maxmemory-policy noeviction/maxmemory-policy allkeys-lfu/" "/etc/redis/redis.conf"
  mkdir -p /run/php/
  touch /run/php/php7.3-fpm.pid
  chown -R www-data:www-data /var/www/*
  chmod -R 755 /var/www/*

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
#  mkdir /var/www/html/wordpress
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
  cd /var/www/html/wordpress
  wp core download --allow-root
  mv /server_dir/wp-config.php /var/www/html/wordpress
  echo "Configuring Wordpress parameters"
  wp core install --allow-root \
      --url=${WP_URL} \
      --title=${WP_TITLE} \
      --admin_user=${WP_ADMIN} \
      --admin_password=${WP_ADMIN_PASS} \
      --admin_email=${WP_ADMIN_EMAIL}
  wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS}

  mv /server_dir/object-cache.php /var/www/html/wordpress/wp-content/

  wp plugin install --allow-root redis-cache
  wp plugin activate --allow-root redis-cache

fi
  service redis-server start
#  service php7.3-fpm start
exec "$@"