FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PWD}
ENV MYSQL_USER: ${MYSQL_USER}
ENV MYSQL_PASSWORD: ${MYSQL_PWD}
ENV MYSQL_DATABASE: ${MYSQL_DATABASE}

# Ensure db container has the same time settings then server
COPY ./localtime /etc/localtime
COPY ./timezone /etc/timezone

# MySQL configuration
COPY ./my.cnf /etc/mysql/conf.d/sh.my.cnf