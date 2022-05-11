touch file 
chmod 755 file 

cat << stop_file > file
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
USE $MYSQL_DATABASE;
FLUSH PRIVILEGES ;
GRANT ALL ON *.* TO 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
GRANT ALL ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}') ;
FLUSH PRIVILEGES ;
GRANT ALL ON *.* to '$MYSQL_USER'@'%' identified by '$MYSQL_USER_PASSWORD';
DROP DATABASE IF EXISTS test ;
FLUSH PRIVILEGES ;
stop_file

mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < file
exec mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 $@

