#!/bin/bash
mkdir -p /var/logs/redis

chown redis:redis /data
chown redis:redis /var/logs/redis
chmod 0755 /data
chmod 0755 /var/logs/redis

exec /sbin/setuser redis /usr/local/bin/redis-server /etc/redis/redis.conf