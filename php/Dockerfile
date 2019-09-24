# #################################################
# Graphite DockerFile
# Author: João Henrique Abreu
# Date:   06/10/2019
# #################################################

# Base OS
# Using specific image for compatibility with yum
FROM php:7.1-fpm

# Base env variables
ENV WEBROOT /var/www/html

# Base tools
# RUN yum update -y

# Installing php 7.1
RUN apt-get update && apt-get install -y libmemcached-dev zlib1g-dev libmagickwand-dev \    
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-install mysqli pdo pdo_mysql gd \
    && pecl install memcached xdebug imagick \
    && docker-php-ext-enable xdebug memcached imagick 

# Copy general config files to the container
COPY ./graphite.yaml /etc/shapp.yaml
#COPY ./www.conf /etc/php-fpm-7.1.d/www.conf
#COPY ./network /etc/sysconfig/network
#COPY ./xdebug.ini /etc/php-7.1.conf/xdebug.ini
COPY ./xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Logging
RUN mkdir /var/log/graphite 
RUN chmod 777 -R /var/log/graphite

# Xdebug config
#RUN yum groupinstall "Development Tools" -y
#COPY ./xdebug-2.7.2.tgz /tmp/xdebug/xdebug-2.7.2.tgz
#WORKDIR /tmp/xdebug/
#RUN tar -xvzf xdebug-2.7.2.tgz
#WORKDIR /tmp/xdebug/xdebug-2.7.2
#RUN phpize && ./configure && make && cp modules/xdebug.so /usr/lib64/php/7.1/modules

# Assets abd runtime folders
#WORKDIR /var/www/html
#RUN mkdir assets 
#RUN chmod 777 -R assets
#WORKDIR /var/www/html/protected
#RUN mkdir runtime
#RUN chmod 777 -R runtime

# Set dir to open bash in
WORKDIR /var/www/html

# Open ports for xdebug
EXPOSE 9001

#CMD ["php-fpm"]
# ENTRYPOINT [ "entrypoint" ]