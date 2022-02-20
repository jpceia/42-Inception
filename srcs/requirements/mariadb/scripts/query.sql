/* Create Database wordpress*/
CREATE DATABASE wordpress;

/* Create Admin USER */
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;

/* Reload the grant tables */
FLUSH PRIVILEGES;

