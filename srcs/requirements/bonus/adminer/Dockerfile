FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install \
        wget \
        apache2 \
        php \
        php-curl \
        php-cli \
        php-gd \
        libapache2-mod-php \
        php-mysql && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root
RUN mkdir /usr/share/adminer
RUN wget https://www.adminer.org/latest.php
RUN mv latest.php /usr/share/adminer/adminer.php
RUN echo " Alias / /usr/share/adminer/adminer.php" | tee /etc/apache2/conf-available/adminer.conf
RUN a2enconf adminer.conf
RUN sed -i "s/^Listen 80$/Listen 8080/" /etc/apache2/ports.conf

CMD [ "apachectl", "-DFOREGROUND" ]
