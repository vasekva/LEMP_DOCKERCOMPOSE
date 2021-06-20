#!/usr/bin/env bash

  sleep 10
  mkdir -p /run/php/
  touch /run/php/php7.3-fpm.pid
  chown -R www-data:www-data /var/www/*
  chmod -R 755 /var/www/*

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
  cd /var/www/html/wordpress
  wp core download --allow-root
  mv /tools_dir/wp-config.php /var/www/html/wordpress
  echo "Configuring Wordpress parameters"
  wp core install --allow-root \
      --url=${WP_URL} \
      --title=${WP_TITLE} \
      --admin_user=${WP_ADMIN} \
      --admin_password=${WP_ADMIN_PASS} \
      --admin_email=${WP_ADMIN_EMAIL}
  wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS}
fi
exec "$@"