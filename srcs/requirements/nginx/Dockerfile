FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install openssl nginx

WORKDIR /root

# SSL Certificate Setting
# https://stackoverflow.com/questions/68948910/make-a-certificate-for-testing-purposes-but-not-self-signed
RUN openssl req -x509 -nodes -days 365 -subj "/C=PT/ST=Portugal/L=Lisbon/O=42School/OU=42Lisboa/CN=jceia" \
	-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

# Removing defaults
# RUN rm -f index.nginx-debian.html
RUN rm -f /etc/nginx/sites-enabled/default

# Copying config file
COPY ./conf/nginx.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

COPY ./scripts/init.sh .

CMD bash init.sh
