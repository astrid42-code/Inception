
#installation mariadb-server (syst de gestion de base de donnees)
RUN apt-get -y install mariadb-server

#installation php-mysql (realiser des applis php avec une base de donnees mysql)
RUN apt-get -y install php-mysql

# # dans le mariadb container /var/lib/mysql appartient au user msyql (uid 999),
# # ce qui est different dans la machine hote ubuntu
# # donc on efface tout user pouvant exister en en creant un nouveau (user mysql)
# sudo userdel mysql 
# sudo useradd -u 999 mysql

# # puis on cree le proprietaire de /data/mysql dans la machine hote

# sudo mkdir -p /data/mysql
# sudo chown -R mysql:mysql /data/mysql

