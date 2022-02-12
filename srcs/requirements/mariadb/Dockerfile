FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /root

RUN apt-get update
RUN apt-get upgrade -y
# RUN apt-get -y install wget		# for downloads

# Install MariaDB
RUN apt-get -y install mariadb-server

# init script and launch bash
COPY ./conf/init.sh ./

CMD bash init.sh
