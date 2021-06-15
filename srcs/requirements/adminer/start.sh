#!/usr/bin/env bash

  sleep 50

  mkdir -p /run/php/
  touch /run/php/php7.3-fpm.pid
  chown -R www-data:www-data /var/www/*
  chmod -R 755 /var/www/*

  mkdir /var/www/html/adminer/ && \
  cd /var/www/html/adminer/

  wget http://www.adminer.org/latest.php -O /var/www/html/adminer/index.php
  exec "$@"
#tail -f /dev/null