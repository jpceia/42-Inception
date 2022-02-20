/* update root password */
UPDATE mysql.user SET password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE user='root';

/* Reload the grant tables */
FLUSH PRIVILEGES;
