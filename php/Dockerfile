# #################################################
# Graphite DockerFile
# Author: João Henrique Abreu
# Date:   06/10/2019
# #################################################

# Base OS
FROM php:7.1-fpm

# Base env variables
ENV WEBROOT /var/www/html

# Installing php 7.1
RUN apt-get update && apt-get install -y vim libmemcached-dev libmagickwand-dev\
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-install mysqli pdo pdo_mysql gd bcmath \
    && pecl install memcached xdebug imagick \
    && docker-php-ext-enable memcached imagick xdebug \
    && mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# Copy general config files to the container
COPY ./graphite.yaml /etc/shapp.yaml
COPY ./xdebug.ini $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini
COPY ./root.bashrc /root/.bashrc

# Logging
RUN mkdir /var/log/graphite 
RUN chmod 777 -R /var/log/graphite

# Assets and runtime
WORKDIR /var/www/html
RUN mkdir assets
RUN chmod 777 -R assets
WORKDIR /var/www/html/protected
RUN mkdir runtime
RUN chmod 777 -R runtime

# Set dir to open bash in
WORKDIR /var/www/html

# Open ports for xdebug
EXPOSE 9001