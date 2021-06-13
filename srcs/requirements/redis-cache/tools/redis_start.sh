#!/usr/bin/env bash

sed -i "s/supervised no/supervised systemd/" "/etc/redis/redis.conf"
sed -i "s/#maxmemory/maxmemory 128M/" "/etc/redis/redis.conf"
sed -i "s/#maxmemory-policy noeviction/maxmemory-policy allkeys-lfu/" "/etc/redis/redis.conf"

  redis-server --daemonize no
  service redis-server start
#exec "$@"