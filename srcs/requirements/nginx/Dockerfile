FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive
ARG DOMAIN_NAME

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install openssl nginx && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root

# SSL Certificate Setting
# https://stackoverflow.com/questions/68948910/make-a-certificate-for-testing-purposes-but-not-self-signed
RUN openssl req -x509 -nodes -days 365 -subj "/C=PT/ST=Portugal/L=Lisbon/O=42School/OU=42Lisboa/CN=jceia" \
	-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

# Removing defaults
# RUN rm -f index.nginx-debian.html
RUN rm -f /etc/nginx/sites-enabled/default

# Copying config file
COPY ./conf/ /etc/nginx/sites-available/
RUN sed -i "s/\$DOMAIN_NAME/${DOMAIN_NAME}/g" /etc/nginx/sites-available/*
RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

CMD ["nginx" , "-g", "daemon off;"]
