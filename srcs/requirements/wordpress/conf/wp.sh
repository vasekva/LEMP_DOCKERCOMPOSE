#!/usr/bin/env bash
sed -i "s/listen = \/run/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
sed -i "s/supervised no/supervised systemd/" "/etc/redis/redis.conf"
  mkdir -p /run/php/
  touch /run/php/php7.3-fpm.pid
  chown -R www-data:www-data /var/www/*
  chmod -R 755 /var/www/*

if [ ! -f /var/www/html/wp-config.php ]; then
  mkdir -p /var/www/html/
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
  cd var/www/html/
  wp core download --allow-root
  mv /var/www/wp-config.php /var/www/html/
  wp core install --allow-root \
    --url=${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP} \
    --title=${WORDPRESS_WEBSITE_TITLE} \
    --admin_user=${WORDPRESS_ADMIN_USER} \
    --admin_password=${WORDPRESS_ADMIN_PASSWORD} \
    --admin_email=${WORDPRESS_ADMIN_EMAIL}
  wp user create --allow-root datmol datmol@42.fr --user_pass=datmol
  mv /var/www/object-cache.php /var/www/html/wp-content/
fi
service redis-server start
exec "$@"