FROM debian:buster

# installation php
RUN	apt-get update -y 
RUN	apt-get upgrade -y 
RUN apt-get -y install php7.3 php7.3-fpm php7.3-common php7.3-mysql php7.3-curl php7.3-intl php7.3-mbstring php7.3-cli php7.3-soap php7.3-imap

COPY wp-config.php /var/www/html/wordpress/.

COPY ./wp_script.sh  /etc/

# sh ./auto_index.sh

EXPOSE	9000
CMD [ "bash", "/etc/wp_script.sh" ]