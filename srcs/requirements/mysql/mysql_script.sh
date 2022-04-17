MYSQL_ROOT_USER=root
MYSQL_PASSWORD=123soleil
MYSQL_ROOT_PASSWORD=lol
MYSQL_USER=asgaulti
MYSQL_DATABASE=wpwordpress

# creer un fichier et y mettre les infos
touch file 
chmod 755 file 

cat << stop_file > file
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
USE $MYSQL_DATABASE;
FLUSH PRIVILEGES ;
GRANT ALL ON *.* TO 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
GRANT ALL ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}') ;
GRANT ALL ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';
FLUSH PRIVILEGES ;
stop_file

echo "Test to see if my file is correctly created"
# cat file
mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < file
exec mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 $@

# killall mysqld # kill l'arriere plan
# mysqld #relance en premer plan pour que ca ferme pas mon container
