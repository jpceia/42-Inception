FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /root

RUN apt-get update
# RUN apt-get upgrade -y
# RUN apt-get install 

# Install MariaDB
RUN apt-get -y install \
    gettext-base \
    mariadb-server

RUN sed -i "s/bind-address/# bind-address/" /etc/mysql/mariadb.conf.d/50-server.cnf

# init script and launch bash
COPY ./scripts/query.sql .
COPY ./scripts/init.sh .

CMD bash init.sh
