FROM debian:buster

EXPOSE 3306

#installation mariadb-server (syst de gestion de base de donnees)
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server
RUN apt-get -y install mariadb-client
RUN apt-get -y install php-mysql

COPY ./mysql.conf /var/lib/mysql/mysql.conf

RUN mkdir -p /var/run/mysqld

COPY ./mysql_script.sh /var/run/mysqld

# RUN chmod 700 /var/run/
RUN     chown -R mysql /var/run/mysqld

# CMD     ["bash", "/var/script.sh"]
CMD     ["sh", "/var/run/mysqld/mysql_script.sh"]


# docker exec -it nom container sh > pour lancer bash et etre en mode interactif
# mysql -uroot -plol > mysql -unomutilisateur -ppassword
# SHOW DATABASES; -> te liste les info sur tes databases (il doit y avoir une ligne avec ma db ici wpwordpress)