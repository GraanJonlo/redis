#!/bin/bash

chown redis:redis /data
chmod 0755 /data

exec /sbin/setuser redis /usr/local/bin/redis-server /etc/redis/redis.conf
#/usr/local/bin/redis-server /etc/redis/redis.conf

