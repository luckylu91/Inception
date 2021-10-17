#!/bin/bash
service mysql start

commands=$(cat << END_OF_COMMANDS
DROP USER $MYSQL_USER@'wordpress';
FLUSH PRIVILEGES;
CREATE USER $MYSQL_USER@'wordpress';
CREATE DATABASE $WORDPRESS_DATABASE;
GRANT ALL PRIVILEGES on $WORDPRESS_DATABASE.* TO $MYSQL_USER@'wordpress' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
END_OF_COMMANDS
)
#  "GRANT ALL PRIVILEGES on $WORDPRESS_DATABASE.* TO '$MYSQL_USER'@'wordpress' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root -p

echo "===== MySQL commands ========="
echo "$commands"
echo "===== End MySQL commands ====="
while IFS= read -r line; do
    echo "$line" | mysql -u root -password="$MYSQL_ROOT_PASSWORD"
done <<< "$commands"
# echo "$commands" | mysql -u root -password="$MYSQL_ROOT_PASSWORD"

