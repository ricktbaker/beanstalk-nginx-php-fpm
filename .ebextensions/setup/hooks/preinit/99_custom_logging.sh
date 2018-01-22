#!/bin/bash
set -xe

/opt/elasticbeanstalk/bin/log-conf -n'nginx' -l'/var/log/nginx/*' -f /opt/elasticbeanstalk/support/conf/nginx.logrotate.conf
/opt/elasticbeanstalk/bin/log-conf -n'php-fpm' -l'/var/log/php-fpm/7.1/*log' -f /opt/elasticbeanstalk/support/conf/php-fpm.logrotate.conf

# Remove the 'generic' log rotation configuration in favor of the beanstalk managed one
rm -f /etc/logrotate.d/nginx
rm -f /etc/logrotate.d/php-fpm-7.1
