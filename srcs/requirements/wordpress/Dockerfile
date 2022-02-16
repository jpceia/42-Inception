FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

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
	php-mbstring \
	mariadb-client

WORKDIR /var/www/html/

# Install Wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

# Change authorization
RUN chown -R www-data:www-data *
RUN chmod -R 755 /var/www/*

COPY ./conf/wp-config.php .
COPY ./scripts/init.sh .

CMD bash init.sh
