#!/bin/bash

# WORDPRESS INSTALLATION

mkdir -p $WORDPRESS_PARENT_PATH
cd $WORDPRESS_PARENT_PATH
curl -O https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
rm latest.tar.gz
chown -R www-data:www-data $WORDPRESS_PATH
find $WORDPRESS_PATH -type d -exec chmod 750 {} \;
find $WORDPRESS_PATH -type f -exec chmod 640 {} \;


# WORDPRESS CONFIG

cd $WORDPRESS_PATH
cp $CONFIG/wp-config.php $WORDPRESS_PATH


# PHP CONFIF

cp $CONFIG/www.conf $PHP_FPM_CONF_LOCATION/www.conf
