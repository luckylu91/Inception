#!/bin/bash

service mysql start

if [ -z "$(echo "SHOW DATABASES LIKE '""$WORDPRESS_DATABASE""';" | mysql -u root  -password=""$MYSQL_ROOT_PASSWORD"")" ]; then
    echo "CREATE DATABASE $WORDPRESS_DATABASE;" | mysql -u root -password="$MYSQL_ROOT_PASSWORD"
    mysql -u root -password="$MYSQL_ROOT_PASSWORD" -D $WORDPRESS_DATABASE < $CONFIG/dbexport.sql
fi

commands=$(cat << END_OF_COMMANDS
DROP USER $MYSQL_USER@'%';
FLUSH PRIVILEGES;
CREATE USER IF NOT EXISTS $MYSQL_USER@'%';
GRANT ALL PRIVILEGES on $WORDPRESS_DATABASE.* TO $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
END_OF_COMMANDS
)

echo "===== MySQL commands ========="
echo "$commands"
echo "===== End MySQL commands ====="
while IFS= read -r line; do
    echo "$line" | mysql -u root -password="$MYSQL_ROOT_PASSWORD"
done <<< "$commands"

