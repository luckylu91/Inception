#!/bin/bash
cd /var/www/html/
curl -O https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
rm latest.tar.gz
chown -R www-data:www-data /var/www/html/wordpress
find /var/www/html/wordpress/ -type d -exec chmod 750 {} \;
find /var/www/html/wordpress/ -type f -exec chmod 640 {} \;
cd wordpress
mv wp-config-sample.php wp-config.php
