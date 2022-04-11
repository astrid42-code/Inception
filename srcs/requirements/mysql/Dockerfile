FROM debian:buster

EXPOSE 3306

#installation mariadb-server (syst de gestion de base de donnees)
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server
RUN apt-get -y install mariadb-client
RUN apt-get -y install php-mysql
# RUN apt-get -y install php7.3 php7.3-fpm php7.3-common php7.3-mysql php7.3-curl php7.3-intl php7.3-mbstring php7.3-cli php7.3-soap php7.3-imap

#installation php-mysql (realiser des applis php avec une base de donnees mysql)
# RUN apt-get update -y
# RUN apt-get upgrade -y

COPY ./mysql.conf /var/lib/mysql/mysql.conf

RUN mkdir -p /var/run/mysqld

COPY ./script.sh /var/run/mysqld

# RUN chmod 700 /var/run/
RUN     chown -R mysql /var/run/mysqld

# CMD     ["bash", "/var/script.sh"]
CMD     ["bash", "/var/run/mysqld/script.sh"]

# creer un script qui va set un user root sur la bdd et un autre usr avec les var d'env qu'on lui donne (voir sujet)
# docker exec -it nom container sh > pour lancer bash et etre en mode interactif
# mysql -uroot -plol > mysql -unomutilisateur -ppassword
# SHOW DATABASES; -> te liste les info sur tes databases (il doit y avoir une ligne avec ma db ici wpwordpress)