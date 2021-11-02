cd $BASEDIR

if [ -z "$(ls -A ""$WORDPRESS_PATH"")" ]; then

   # WORDPRESS INSTALLATION

   tar -xvf latest.tar.gz --directory $WORDPRESS_PARENT_PATH
   rm latest.tar.gz

   chown -R www-data:www-data $WORDPRESS_PATH
   find $WORDPRESS_PATH -type d -exec chmod 750 {} \;
   find $WORDPRESS_PATH -type f -exec chmod 640 {} \;

   sed -i "s/define( *'DB_NAME' *,.*) *;/define( 'DB_NAME', '$WORDPRESS_DATABASE');/g"     $CONFIG/wp-config.php
   sed -i "s/define( *'DB_USER' *,.*) *;/define( 'DB_USER', '$MYSQL_USER');/g"             $CONFIG/wp-config.php
   sed -i "s/define( *'DB_PASSWORD' *,.*) *;/define( 'DB_PASSWORD', '$MYSQL_PASSWORD');/g" $CONFIG/wp-config.php
   cp $CONFIG/wp-config.php $WORDPRESS_PATH

fi


service php7.3-fpm start
