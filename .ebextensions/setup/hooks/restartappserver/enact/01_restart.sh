#!/usr/bin/env bash
set -e

service nginx restart
service php-fpm restart
