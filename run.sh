#!/bin/bash

/init.sh

#======== DELETE INIT CODE ==
sed -i "s/^\/init.sh//" /run.sh

php-fpm7.0 &
nginx -g 'daemon off;'