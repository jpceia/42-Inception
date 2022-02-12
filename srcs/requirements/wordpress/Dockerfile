FROM debian:buster

EXPOSE 4444

ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /var/www/html/

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install wget		# for downloads

# Install PHP My Admin
RUN apt-get -y install \
	php7.3 \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd \
	php-cli \
	php-mbstring

# Install Wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

COPY ./conf/wp-config.php .

CMD php -S 0.0.0.0:8000 -t wordpress
