# #################################################
# Graphite DockerFile
# Author: João Henrique Abreu
# Date:   06/10/2019
# #################################################

# Base OS
# Using specific image for compatibility with yum
FROM amazonlinux:2018.03.0.20190514

# Base env variables
ENV WEBROOT /var/www/html

# Base tools
RUN yum install wget which vim -y
RUN yum update -y

# Installing php 7.1
RUN yum install php71 \
                php71-mysqlnd \
                php71-pecl-memcached \
                php71-jsonc \
                php71-pdo \
                php71-mbstring \
                php71-gd \
                php71-bcmath \
                php71-devel \
                php71-xdebug \       
                php71-fpm \         
                php71-pecl-imagick -y

# Apache Install and configuration
RUN yum install httpd24 httpd24-tools mod24_ssl mod24_fcgi nc -y

# Copy general config files to the container
COPY ./httpd.shdev.conf /etc/httpd/conf.d/httpd.shdev.conf
COPY ./graphite.yaml /etc/shapp.yaml
COPY ./.bashrc /root/.bashrc
COPY ./graphite.vimrc /root/.vimrc
COPY ./network /etc/sysconfig/network
COPY ./www.conf /etc/php-fpm-7.1.d/www.conf
COPY ./php7.1-fpm.conf /etc/httpd/conf.d/php-fpm-7.1.conf
COPY ./php7.1.ini /etc/php-7.1.conf/php.ini
COPY ./composer.phar /usr/local/bin/composer

# Logging
RUN mkdir /var/log/graphite 
RUN chmod 777 -R /var/log/graphite

# Xdebug config
RUN yum groupinstall "Development Tools" -y
COPY ./xdebug-2.7.2.tgz /tmp/xdebug/xdebug-2.7.2.tgz
WORKDIR /tmp/xdebug/
RUN tar -xvzf xdebug-2.7.2.tgz
WORKDIR /tmp/xdebug/xdebug-2.7.2
RUN phpize && ./configure && make && cp modules/xdebug.so /usr/lib64/php/7.1/modules

# Assets abd runtime folders
WORKDIR /var/www/html
RUN mkdir assets 
RUN chmod 777 -R assets
WORKDIR /var/www/html/protected
RUN mkdir runtime
RUN chmod 777 -R runtime

# Set dir to open bash in
WORKDIR /var/www/html

# Open ports for apache, xdebug
EXPOSE 80 8000 9000

ENTRYPOINT ["apachectl", "-DFOREGROUND"]
