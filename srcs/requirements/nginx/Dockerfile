FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /var/www/html/

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install wget		# for downloads

# Install nginx
RUN apt-get -y install nginx

# SSL Certificate Setting
# https://stackoverflow.com/questions/68948910/make-a-certificate-for-testing-purposes-but-not-self-signed
RUN openssl req -x509 -nodes -days 365 -subj "/C=PT/ST=Portugal/L=Lisbon/O=42School/OU=42Lisboa/CN=jceia" \
	-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

# Removing defaults
RUN rm -f index.nginx-debian.html
RUN rm -f /etc/nginx/sites-enabled/default

# Copying config file
COPY ./conf/nginx.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off;"]
#CMD bash