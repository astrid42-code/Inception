# if [ ! -f /var/www/html/wp-config.php ];
# then
wp core download --allow-root
# wp config create --allow-root
# moving my php config file
# echo "DEBUG OF FILE"
# cat /etc/wp-config.php
rm /var/www/html/wp-config-sample.php 
cp /etc/wp-config.php /var/www/html

# echo "DEBUG OF FILE"

# changing rights of my php config 
chmod -R 755 /var/www/

# MYSQL_ROOT_USER=root
# MYSQL_PASSWORD=123soleil
# MYSQL_ROOT_PASSWORD=lol
# MYSQL_USER=user
# MYSQL_DATABASE=wpwordpress

# do a loop until i am correctly connected to my database

until mysqladmin -hmysql -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} ping && \
         mariadb -hmysql -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} -e "SHOW DATABASES;" | grep ${MYSQL_DATABASE}; do
    sleep 2
    echo "waiting to connect..."
done


wp config create --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost=mysql --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root # Configure la DB
wp core install --url="asgaulti.42.fr" --title="Pingu's world" --admin_user="${WORDPRESS_ROOT_LOGIN}"\
	--admin_password="${WORDPRESS_ROOT_PASSWORD}" --admin_email="asgaulti@student.42.fr" --skip-email --allow-root #Configure le site et l'admin
wp user create $WORDPRESS_USER_LOGIN test@example.com --user_pass="$WORDPRESS_USER_PASSWORD" --role=author --allow-root
# wp theme install <theme_name> --activate --allow-root
# fi

php-fpm7.3 -F -R

#  if [ ! -f var/www/wp-config.php ];
# then 
# fi
