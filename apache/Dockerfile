# Using specific image for compatibility with yum
FROM amazonlinux:2018.03.0.20190514
ENV GRAPHITE_CODE /var/www/html

# Apache + PHP-FPM Install and configuration
RUN yum update -y && yum install -y httpd24 \
                                httpd24-tools \
                                mod24_ssl \
                                mod24_fcgi \
                                nc \
                                php71 \
                                php71-cli \
                                php71-common \
                                php71-json \
                                php71-opcache \
                                php71-mysql \
                                php71-mbstring \
                                php71-mcrypt \
                                php71-zip \
                                php71-fpm \
                                mod24_fcgid.x86_64 \
                                php71-pecl-memcached.x86_64 \
                                php71-pdo.x86_64 \
                                php71-mysqlnd.x86_64 \
                                curl \
                                supervisor

# Installing php 7.1
RUN  yum install -y vim libmemcached-dev libmagickwand-dev \
                        pecl install memcached xdebug imagick


# Copy general config files to the container
COPY conf/apache.conf /etc/httpd/conf.d/apache.conf

COPY conf/supervisor.conf /etc/supervisor.conf
COPY conf/www.conf /etc/php-fpm-7.1.d/www.conf

# Copy general config files to the container
COPY app-config/graphite.yaml /etc/shapp.yaml
#COPY ./xdebug.ini $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini
COPY conf/root.bashrc /root/.bashrc

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

# Copy general config files to the container
COPY app-config/graphite.yaml /etc/shapp.yaml
COPY conf/xdebug.ini $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini
COPY conf/root.bashrc /root/.bashrc

# Set dir to open bash in
WORKDIR /var/www/html

EXPOSE 80

COPY conf/entrypoint.sh /entrypoint.sh
RUN chmod 550 /entrypoint.sh

RUN yum install python-pip python-wheel -y && \
    curl -O https://bootstrap.pypa.io/get-pip.py

RUN python get-pip.py --user
RUN /root/.local/bin/pip install supervisor




CMD ["/entrypoint.sh"]