/* Create Database */
CREATE DATABASE wordpress;

/* Create Admin USER */
CREATE USER '$MYSQL_ADMIN_USER'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_ADMIN_USER'@'%' WITH GRANT OPTION;

/* Reload the grant tables */
FLUSH PRIVILEGES;

/* use auth_socker plugin for authentication, it will check the user is
   connecting using a UNIX socker and then compares the username */
UPDATE mysql.user SET plugin='' WHERE user='root';
