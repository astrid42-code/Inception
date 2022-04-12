# config / dl phpmyadmin
apt-get https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv ./phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpmyadmin
mv ./config.phpmyadmin.php /var/www/html/phpmyadmin/config.inc.php
rm /var/www/html/phpmyadmin/config.sample.inc.php

# dl wp (-c creation arch / -x extraction arch / -z compression zip / -v : mode verbose pour afficher ce qui se passe pendant l'operation)
apt-get -c https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
mv wordpress /var/www/html
# mv ./wp-config.php /var/www/html/wordpress/.

#supprimer fichier par defaut de config
rm /var/www/html/wordpress/wp-config-sample.php

