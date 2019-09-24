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
RUN apt-get update && apt-get install -y libmemcached-dev zlib1g-dev libmagickwand-dev \    
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-install mysqli pdo pdo_mysql gd bcmath jsonc \
    && pecl install memcached xdebug imagick \
    && docker-php-ext-enable xdebug memcached imagick 

# Copy general config files to the container
COPY ./graphite.example.yaml /etc/shapp.yaml
COPY ./xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Logging
RUN mkdir /var/log/graphite 
RUN chmod 777 -R /var/log/graphite

# Set dir to open bash in
WORKDIR /var/www/html

# Open ports for xdebug
EXPOSE 9001