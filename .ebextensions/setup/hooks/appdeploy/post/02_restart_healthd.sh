#!/bin/bash

set -xe

if [ -d /etc/healthd -a ! -f /var/elasticbeanstalk/healthd/current_proxy_server ]
then
    /opt/elasticbeanstalk/bin/healthd-configure --appstat-log-path /var/log/nginx/healthd/application.log --appstat-unit sec --appstat-timestamp-on 'completion'
    /opt/elasticbeanstalk/bin/healthd-restart
    echo "nginx" > /var/elasticbeanstalk/healthd/current_proxy_server
fi
