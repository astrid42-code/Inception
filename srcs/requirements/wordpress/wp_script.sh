wp core download --allow-root
# wp config create --allow-root
# moving my php config file
# echo "DEBUG OF FILE"
# cat /etc/wp-config.php
cp /etc/wp-config.php /var/www/

# echo "DEBUG OF FILE"

# changing rights of my php config 
chmod -R 755 /var/www/
# do a loop until i am correctly connected to my database
echo "test debug test debug"

MYSQL_ROOT_USER=root
MYSQL_PASSWORD=123soleil
MYSQL_ROOT_PASSWORD=lol
MYSQL_USER=asgaulti
MYSQL_DATABASE=wpwordpress


# Probleme : impossible de se co sur le host depuis le conteneur wordpress -> marche sur mariadb mais pas sur wordpress

until mysqladmin -hlocalhost -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} ping && \
         mariadb -hlocalhost -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} -e "SHOW DATABASES;" | grep ${MYSQL_DATABASE}; do
    sleep 2
    echo "waiting to connect..."
done
echo "test debug test debug4"


wp core install --url="asgaulti.42.fr" --title="Pingu's world" --admin_user="${MYSQL_ROOT_USER}"\
	--admin_password="${MYSQL_ROOT_PASSWORD}" --admin_email="asgaulti@student.42.fr" --skip-email --allow-root #Configure le site et l'admin
wp config create --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root # Configure la DB
wp user create asgaulti test@example.com --role=author --allow-root
# wp theme install <theme_name> --activate --allow-root

php-fpm7.3 -F -R