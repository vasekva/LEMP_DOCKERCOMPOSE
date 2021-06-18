#!/usr/bin/env bash

sleep 40

cp -r ./page/* /var/www/html/

exec "$@"