# FROM debian:buster

# # installation php
# RUN	apt-get update -y 
# RUN	apt-get upgrade -y 
# RUN apt-get -y install php7.3 php7.3-fpm php7.3-common php7.3-mysql php7.3-curl php7.3-intl php7.3-mbstring php7.3-cli php7.3-soap php7.3-imap && \
#     mkdir -p /run/php

# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#     && chmod +x wp-cli.phar
#     && mv wp-cli.phar /usr/local/bin/wp

# RUN mkdir /var/www/html && chmod 700 /var/www/html

# COPY wp-config.php /var/www/html/wordpress/.

# COPY ./wp_script.sh  /etc/

# # sh ./auto_index.sh

# EXPOSE	9000
# CMD [ "bash", "/etc/wp_script.sh" ]

FROM    debian:buster 

EXPOSE  9000

RUN     apt-get update && \
        mkdir -p /var/run && \
        mkdir -p /var/www/html && \
        apt-get -y install  curl mariadb-client php php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip && \
        mkdir -p /run/php/

RUN     curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
        php wp-cli.phar --info && \
        chmod +x wp-cli.phar && \
        mv wp-cli.phar /usr/local/bin/wp

COPY    ./www.conf /etc/php/7.3/fpm/pool.d/

COPY    ./wp-config.php /etc/

COPY    ./wp_script.sh /etc/

RUN  chmod -R 755 /var/www/html/

RUN     chmod 755 /etc/wp_script.sh

CMD     ["sh", "/etc/wp_script.sh"]