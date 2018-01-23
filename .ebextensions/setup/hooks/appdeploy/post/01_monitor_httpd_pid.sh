#!/bin/bash

set -xe

/opt/elasticbeanstalk/bin/healthd-track-pidfile --proxy nginx
/opt/elasticbeanstalk/bin/healthd-track-pidfile --name application --location /var/run/php-fpm/php-fpm-7.1.pid
