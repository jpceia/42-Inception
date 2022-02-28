FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

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
		mariadb-client \
		php-redis \
		redis-tools && \
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
COPY ./scripts/init.sh .

ENTRYPOINT [ "bash", "init.sh" ]
CMD [ "wp", "server", "--host=wordpress", "--port=9000"]
