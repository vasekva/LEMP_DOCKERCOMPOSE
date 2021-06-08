#!/usr/bin/env bash

mkdir -p /var/run/mysqld
chown mysql: /var/run/mysqld
mysql < install_password.sql
systemctl restart mysql