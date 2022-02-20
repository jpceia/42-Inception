FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /root

RUN apt-get update && \
    apt-get -y install \
    gettext-base \
    mariadb-server

RUN sed -i "s/^bind-address/#bind-address/" /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i "s/^#port/port/" /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i "s/^#general_log/general_log/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# init script and launch bash
COPY ./scripts/query.sql .
COPY ./scripts/init.sh .

CMD bash init.sh
