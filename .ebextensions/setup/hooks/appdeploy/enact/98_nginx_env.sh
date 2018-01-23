#!/bin/bash

/opt/elasticbeanstalk/bin/get-config environment | python -c 'import json,sys;obj=json.load(sys.stdin);open("/etc/nginx/fastcgi_params_env", "wb").write("\n".join(["fastcgi_param %s %s;" % (key, obj[key]) for key in obj]));'
