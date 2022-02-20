FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install redis-server

RUN sed -i "s/^bind 127.0.0.1.*$/bind 0.0.0.0/" /etc/redis/redis.conf
RUN sed -i "s/^# maxmemory <bytes>.*$/maxmemory 256mb/" /etc/redis/redis.conf
RUN sed -i "s/^# maxmemory-policy.*$/maxmemory-policy allkeys-lru/" /etc/redis/redis.conf

# Check if redis works in wordpress using
# "redis-cli -h redis ping" in wordpress host
CMD redis-server /etc/redis/redis.conf --daemonize no

