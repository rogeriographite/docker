FROM mysql:5.7

# Ensure db container has the same time settings then server
COPY ./localtime /etc/localtime
COPY ./timezone /etc/timezone

# MySQL configuration
COPY ./my.cnf /etc/mysql/conf.d/sh.my.cnf