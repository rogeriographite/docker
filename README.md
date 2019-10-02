# Graphite Docker environment setup
WIP readme - assuming existing local environment

## Container Structure
- mysql
  - 5.7  
- memcached
  - Default installation
- apache
  - fcgi setup
  - PHP 7.1
  - bcmath, fpm, gd, imagick, memcached, pdo_mysql, xdebug 

## Installation steps
- Create `.env` file (.env.example provided)
  - `GRAPHITE_CODE` path to code clone in local machine
  - `*_MAPPED_PORT` custom ports to be used by host (ie.: serve from apache, connecting to mysql) 
- Create `graphite.yaml` file (graphite.example.yaml provided, notice that mysql, memcached and async settings are already populate with docker-friendly names)
-  
- docker run --rm --interactive --tty -v $PWD:/app composer install
- Run `docker-compose up -d`

## Testing
Recommend running `runtests -u` outsite container as it takes considerable less time then within container (known docker lower I/O performance with phpunit)
