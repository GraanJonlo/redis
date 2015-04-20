FROM phusion/baseimage:0.9.16

MAINTAINER Andy Grant <andy.a.grant@gmail.com>

ENV REDIS_VERSION 2.8.19

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
  build-essential \
  wget

RUN \
  cd /tmp && \
  wget http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz && \
  tar xvzf redis-$REDIS_VERSION.tar.gz && \
  cd redis-$REDIS_VERSION && \
  make && \
  make install && \
  mkdir -p /etc/redis && \
  rm -rf /tmp/redis-$REDIS_VERSION && \
  groupadd redis && \
  useradd -g redis redis

VOLUME ["/data"]

WORKDIR /data

RUN mkdir /etc/service/redis
ADD redis.sh /etc/service/redis/run
ADD redis.conf /etc/redis/redis.conf

EXPOSE 6379

CMD ["/sbin/my_init"]
