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

# Apache Install and configuration
RUN yum install httpd24 httpd24-tools mod24_ssl mod24_fcgi nc -y

# Copy general config files to the container
COPY ./apache.conf /etc/httpd/conf.d/apache.conf

# Open ports for apache
EXPOSE 80

ENTRYPOINT ["apachectl", "-DFOREGROUND"]
