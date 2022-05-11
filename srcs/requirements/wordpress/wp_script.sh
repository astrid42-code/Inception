wp core download --allow-root

cp /etc/wp-config.php /var/www/html

chmod -R 755 /var/www/

until mysqladmin -hmysql -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} ping && \
         mariadb -hmysql -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} -e "SHOW DATABASES;" | grep ${MYSQL_DATABASE}; do
    sleep 2
    echo "waiting to connect..."
done


wp config create --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost=mysql --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root # Configure la DB
wp core install --url="asgaulti.42.fr" --title="Pingu's world" --admin_user="${WORDPRESS_ROOT_LOGIN}"\
	--admin_password="${WORDPRESS_ROOT_PASSWORD}" --admin_email="asgaulti@student.42.fr" --skip-email --allow-root #Configure le site et l'admin
wp user create "${WORDPRESS_USER_LOGIN}" --user_pass="${WORDPRESS_USER_PASSWORD}" test@example.com --role=author --allow-root

php-fpm7.3 -F -R
