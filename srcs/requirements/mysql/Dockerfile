FROM debian:buster

EXPOSE 3306

#installation mariadb-server (syst de gestion de base de donnees)
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server
RUN apt-get -y install mariadb-client
RUN apt-get -y install php-mysql

COPY ./mysql.conf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/run/mysqld

COPY ./mysql_script.sh /var/run/mysqld

RUN     chown -R mysql /var/run/mysqld

CMD     ["sh", "/var/run/mysqld/mysql_script.sh"]
