# Graphite Docker environment setup
Following the below steps after cloning down this repo will build and start a multi-container SpareHire environment (including a db container and a webapp container):

### Sync application code locally and prep it
- SpareHire/sh_web repo should be synced down to a local code dir, something like /var/www/SpareHire
- $SHCODE environment variable must point to code root directory

```
% export SHCODE='[SH code dir]'
```

- Assets and runtime directories must be created

```
% mkdir $SHCODE/assets
% mkdir $SHCODE/protected/runtime
```

- Composer must be installed/run to initialize app dependencies:

```
% wget https://getcomposer.org/installer
% php installer --install-dir=/usr/local/bin --filename=composer

% cd $SHCODE/protected/libraries
% /usr/local/bin/composer install
```

### Create an app cfg file
Cfg file needs to be inside the docker/webapp directory - copy the base SpareHire/protected/config/shapp.example.yaml file

```
cp ./webapp/shapp.dockerexample.yaml ./webapp/shapp.yaml
```

Adjust cfg settings as needed. Currently, a few MUST be set with exact values to match our docker configuration:
- Application MySQL user/password must match the ones set up in docker-compose.yml
- SH_LOG_FILE_PATH env var must match the log directory volume set up in docker-compose.yml

### Build/initialize/start Docker containers with 1 command
From within the docker repo dir, run the following:
```
$ docker-compose up -d
```

The webapp should now be accessible at localhost:8080. Containers can be logged into (shell access) via:
```
% docker exec -it <containerName> bash
```

If this is the first time the containers have been started, the db will need to be initialized. Use the above command to access the webapp via shell, then run the following command (NOTE: This WILL clear and rebuild the database entirely. Do NOT run this command if you want to keep any data in the db):
```
% syncSchema loadBaseline
```

For delta schema changes, install them via the same command as above but WITHOUT the "loadBaseline" parameter.

Unit tests can be run after logging into webapp container via the following command:
```
% runtests -u
```

The above syncSchema and runtests steps can also be run directly from the host machine command line via the following:
```
% docker exec -it composerenv_webapp_1 /bin/bash -c "/var/www/html/protected/yiic Util Run syncSchema loadBaseline"

% docker exec -it composerenv_webapp_1 /bin/bash -c "/var/www/html/protected/testRunner.php -u"
```
