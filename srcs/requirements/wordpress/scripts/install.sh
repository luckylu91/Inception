#!/bin/bash

# WORDPRESS DOWNLOAD

mkdir -p $WORDPRESS_PARENT_PATH
cd $BASEDIR
curl -O https://wordpress.org/latest.tar.gz
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar
# mv wp-cli.phar /usr/local/bin/wp


# PHP CONFIF

cp $CONFIG/www.conf $PHP_FPM_CONF_LOCATION/www.conf
