FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget git npm

RUN npm cache clean -f
RUN npm install -g n
RUN n latest
RUN npm i npm@latest -g
RUN npm install -g redis-commander

CMD [ "redis-commander", "--redis-host=redis" ]
