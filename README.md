# What is Redis?

Redis is an open-source, networked, in-memory, key-value data store with optional durability. It is written in ANSI C. The development of Redis has been sponsored by Pivotal since May 2013; before that, it was sponsored by VMware. According to the monthly ranking by DB-Engines.com, Redis is the most popular key-value store. The name Redis means REmote DIctionary Server.

> [wikipedia.org/wiki/Redis](https://en.wikipedia.org/wiki/Redis)

![logo](https://raw.githubusercontent.com/docker-library/docs/master/redis/logo.png)

Tags available
* `latest`, `3`, `3.0`, `3.0.3`
* `3.0.2`
* `3.0.1`
* `3.0.0`
* `2`, `2.8`, `2.8.19`

# How to use this image

## start a redis instance

    docker run --name some-redis [-p 6379:6379] [-v /some/directory:/data] -d graanjonlo/redis[:tag]

This image includes `EXPOSE 6379` (the redis port), so standard container linking will make it automatically available to the linked containers. It also includes `VOLUME ["/data"]` so you can mount a data volume.

