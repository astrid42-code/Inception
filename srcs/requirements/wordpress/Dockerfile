FROM    debian:buster 

EXPOSE  9000

RUN     apt-get update && \
        mkdir -p /var/run && \
        mkdir -p /var/www/html && \
        apt-get -y install  curl mariadb-client php php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip && \
        mkdir -p /run/php/

RUN     curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
        chmod +x wp-cli.phar && \
        mv wp-cli.phar /usr/local/bin/wp

COPY    ./www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY    ./wp-config.php /etc/

COPY    ./wp_script.sh /etc/

RUN     chmod -R 755 /var/www/html/

RUN     chmod 755 /etc/wp_script.sh

CMD     ["sh", "/etc/wp_script.sh"]