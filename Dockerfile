FROM phusion/baseimage:0.10.0

MAINTAINER Andy Grant <andy.a.grant@gmail.com>

ADD https://github.com/kelseyhightower/confd/releases/download/v0.15.0/confd-0.15.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

RUN \
  apt-get update && apt-get install -y \
  build-essential \
  wget

RUN rm -rf /var/lib/apt/lists/*

ENV REDIS_VERSION 3.2.8

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

CMD ["/sbin/my_init", "--quiet"]
