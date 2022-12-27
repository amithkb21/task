#!/bin/bash

git pull origin master

find /var/www/html/wl2/dev/ -name "*.env" -exec sed -i 's/APP_ENV=LOCAL/APP_ENV=DEV/g' {} \;

find /var/www/html/wl2/testing/ -name "*.env" -exec sed -i 's/APP_ENV=LOCAL/APP_ENV=TEST/g' {} \;





