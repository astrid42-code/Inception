until mysqladmin -hmariadb -uroot -plol ping && mariadb -hmariadb -uroot -plol -e "SHOW DATABASES;" | grep "wp_wordpress"; do
	sleep 2
done
echo "successfully connected to mariadb"

# WORDPRESS_DB_HOST=mysql
# WORDPRESS_DB_NAME=wpwordpress
# WORDPRESS_DB_USER=root
# WORDPRESS_DB_PASSWORD=lol
# WORDPRESS_TABLE_PREFIX=wp_


# # config / dl phpmyadmin
# apt-get https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
# tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
# mv ./phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpmyadmin
# mv ./config.phpmyadmin.php /var/www/html/phpmyadmin/config.inc.php
# rm /var/www/html/phpmyadmin/config.sample.inc.php

# # dl wp (-c creation arch / -x extraction arch / -z compression zip / -v : mode verbose pour afficher ce qui se passe pendant l'operation)
# apt-get -c https://wordpress.org/latest.tar.gz
# tar -xzvf latest.tar.gz
# mv wordpress /var/www/html
# # mv ./wp-config.php /var/www/html/wordpress/.

# #supprimer fichier par defaut de config
# rm /var/www/html/wordpress/wp-config-sample.php

# wp core download # Download wordpress (gaffe à être dans le bon dossier les enfants)
wp core install --url="asgaulti.42.fr"/wordpress --title="Pingu's world" --admin_user="${MY_SQL_ROOT_USER}" --admin_password="${MYSQL_ROOT_PASSWORD}" --admin_email="asgaulti@student.42.fr" --skip-email --allow-root #Configure le site et l'admin
wp config create --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="123" --allow-root # Configure la DB
wp user create asgaulti test@example.com --role=author --allow-root
# wp theme install <theme_name> --activate --allow-root