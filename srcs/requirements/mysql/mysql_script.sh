# mysqld& # lance en arriere plan
# until mysqladmin ping; do
#     sleep 2
#     echo "(fail to ping)"
# done
# cd /root/

MYSQL_ROOT_USER=root
MYSQL_ROOT_PASSWORD=lol
MYSQL_USER=asgaulti
MYSQL_DATABASE=wpwordpress

# # config mysql (creation database wp et donner privileges a l'user root)
# mariadb -e "CREATE USER '$MYSQL_ROOT_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'"
# mariadb -e "GRANT ALL PRIVILEGES ON * . * TO '$MYSQL_ROOT_USER'@'%'"
# mariadb -e "FLUSH PRIVILEGES"
# mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE"

# # config mysql (autre user, non admin)
# mariadb -e "CREATE USER '$MYSQL_USER'@'mariadb'"
# mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE . * TO '$MYSQL_USER'@'mariadb'"
# mariadb -e "FLUSH PRIVILEGES"

# killall mysqld # kill l'arriere plan
# mysqld #relance en premer plan pour que ca ferme pas mon container


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
cat file
mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < tmp_file
exec mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 $@
