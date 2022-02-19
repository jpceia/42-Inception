FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install redis-server

RUN mkdir /var/lib/redis
RUN sed -i "s/^bind 127.0.0.1 ::1/bind wordpress/g" /etc/redis/redis.conf

CMD redis-server --port 7777 --daemonize no
