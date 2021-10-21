#!/bin/bash
service mysql start

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

# echo "===== MySQL commands ========="
# echo "$commands"
# echo "===== End MySQL commands ====="
# commands=$(cat << END_OF_COMMANDS
# INSERT INTO $WORDPRESS_DATABASE.wp_users (ID, user_login, user_pass, user_nicename, user_email, user_status, display_name) VALUES ('1000', 'tempuser', MD5('Str0ngPa55!'), 'tempuser', 'support@wpwhitesecurity.com', '0', 'Temp User');
# INSERT INTO $WORDPRESS_DATABASE.wp_usermeta (umeta_id, user_id, meta_key, meta_value) VALUES (NULL, '1000', 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}');
# INSERT INTO $WORDPRESS_DATABASE.wp_usermeta (umeta_id, user_id, meta_key, meta_value) VALUES (NULL, '1000', 'wp_user_level', '10');
# END_OF_COMMANDS
# )

# echo "$commands" | mysql -u root -password="$MYSQL_ROOT_PASSWORD"
