#!/usr/bin/env bash
  mkdir -p /run/php/
  touch /run/php/php7.3-fpm.pid
  chown -R www-data:www-data /var/www/*
  chmod -R 755 /var/www/*

if [ ! -d /var/www/html/wordpress ]; then
  mkdir /var/www/html/wordpress
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
  cd /var/www/html/wordpress
  wp core download --allow-root
  mv /server_dir/wp-config.php /var/www/html/wordpress
  echo "Configuring Wordpress parameters"
  wp core install --allow-root \
      --url=${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP} \
      --title=${WORDPRESS_WEBSITE_TITLE} \
      --admin_user=${WORDPRESS_ADMIN_USER} \
      --admin_password=${WORDPRESS_ADMIN_PASSWORD} \
      --admin_email=${WORDPRESS_ADMIN_EMAIL}
  wp user create --allow-root datmol datmol@42.fr --user_pass=datmol
fi
#  service php7.3-fpm start
exec "$@"