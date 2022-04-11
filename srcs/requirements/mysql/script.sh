mysqld&
until mysqladmin ping; do
    sleep 2
    echo "(fail to ping)"
done
cd /root/

MYSQL_ROOT_USER=root
MYSQL_ROOT_PASSWORD=lol
MYSQL_USER=user
MYSQL_DATABASE=wpwordpress

# config mysql (creation database wp et donner privileges a l'user root)
mariadb -e "CREATE USER '$MYSQL_ROOT_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'"
mariadb -e "GRANT ALL PRIVILEGES ON * . * TO '$MYSQL_ROOT_USER'@'%'"
mariadb -e "FLUSH PRIVILEGES"
mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE"

# config mysql (autre user, non admin)
mariadb -e "CREATE USER '$MYSQL_USER'@'mariadb'"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE . * TO '$MYSQL_USER'@'mariadb'"
mariadb -e "FLUSH PRIVILEGES"

killall mysqld
mysqld
