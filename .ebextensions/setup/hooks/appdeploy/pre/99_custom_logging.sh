#!/bin/bash
set -xe

if [ -f /etc/logrotate.d/nginx ]
then
    /opt/elasticbeanstalk/bin/log-conf -n'nginx' -l'/var/log/nginx/*' -f /opt/elasticbeanstalk/support/conf/nginx.logrotate.conf
    rm -f /etc/logrotate.d/nginx
fi

if [ -f /etc/logrotate.d/php-fpm-7.1 ]
then
    /opt/elasticbeanstalk/bin/log-conf -n'php-fpm' -l'/var/log/php-fpm/7.1/*log' -f /opt/elasticbeanstalk/support/conf/php-fpm.logrotate.conf
    rm -f /etc/logrotate.d/php-fpm-7.1
fi

if [ -d /etc/healthd -a ! -d /var/log/nginx/healthd ]
then
    mkdir -p /var/log/nginx/healthd
    chown -R nginx:nginx /var/log/nginx/healthd
fi
