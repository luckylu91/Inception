#!/bin/bash
service mysql start

echo "mysql service started"

# if [ -z "$(echo "SHOW DATABASES LIKE '""$WORDPRESS_DATABASE""';" | mysql -u root  -password=""$MYSQL_ROOT_PASSWORD"")" ]; then
#     mysql -u root -p $WORDPRESS_DATABASE < $CONFIG/dbexport.sql
# fi

commands=$(cat << END_OF_COMMANDS
DROP USER $MYSQL_USER@'%';
FLUSH PRIVILEGES;
CREATE USER IF NOT EXISTS $MYSQL_USER@'%';
CREATE DATABASE IF NOT EXISTS $WORDPRESS_DATABASE;
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

