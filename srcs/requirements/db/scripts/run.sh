#!/bin/bash
service mysql start

commands=$(cat << END_OF_COMMANDS
CREATE USER '$MYSQL_USER';
CREATE DATABASE $WORDPRESS_DATABASE;
GRANT ALL PRIVILEGES on $WORDPRESS_DATABASE.* TO '$MYSQL_USER' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
END_OF_COMMANDS
)
#  "GRANT ALL PRIVILEGES on $WORDPRESS_DATABASE.* TO '$MYSQL_USER'@'wordpress' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root -p

echo "===MySQL commands==="
echo "$commands"
echo "$commands" | mysql -u root -password="$MYSQL_ROOT_PASSWORD"
echo "===End MySQL commands==="

