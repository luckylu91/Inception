#!/bin/bash
mkdir -p $WORDPRESS_LOCATION/
cd $WORDPRESS_LOCATION/
curl -O https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
rm latest.tar.gz
chown -R www-data:www-data $WORDPRESS_LOCATION/wordpress
find $WORDPRESS_LOCATION/wordpress/ -type d -exec chmod 750 {} \;
find $WORDPRESS_LOCATION/wordpress/ -type f -exec chmod 640 {} \;
cd wordpress
cp $CONFIG/wp-config.php $WORDPRESS_LOCATION/wordpress/

cp $CONFIG/www.conf $PHP_FPM_CONF_LOCATION/www.conf

cp $CONFIG/index.html /
