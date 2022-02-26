FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

# Database parameters
ARG DB_HOST=mariadb
ARG DB_NAME=wordpress
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get -y install \
		wget \
		sendmail \
		php7.3 \
		php-mysql \
		php-fpm \
		php-pdo \
		php-gd \
		php-cli \
		php-mbstring \
		mariadb-client && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html/
RUN chown -R www-data:www-data /var/www

# WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

USER www-data
RUN wp core download
COPY ./conf/wp-extra-config.php .
RUN wp config create \
	--dbname=$DB_NAME \
	--dbhost=$DB_HOST --skip-check \
	--dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD \
	--extra-php < wp-extra-config.php

COPY ./scripts/init.sh .

CMD bash init.sh
