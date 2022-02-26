
if [ -d "/var/lib/mysql/wordpress" ];
then
    echo "Wordpress database already exists"
else
    service mysql start

    echo "Setting wordpress database..."

    # Create Database
    mysql -e "CREATE DATABASE wordpress;"
    
    # Create Admin USER
    mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" # try with wordpress host
    mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;"

    # https://stackoverflow.com/questions/24270733/automate-mysql-secure-installation-with-echo-command-via-a-shell-script
    # Make sure that NOBODY can access the server without a password
    mysql -e "UPDATE mysql.user SET Password = PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User = 'root'"
    mysql -e "DELETE FROM mysql.user WHERE User='';"
    mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
    mysql -e "DROP DATABASE IF EXISTS test;"
    mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
    
    # Make our changes take effect
    mysql -e "FLUSH PRIVILEGES"

    # Any subsequent tries to run queries this way will get access denied because lack of usr/pwd param
    echo "Setup finished"

    service mysql stop
fi

exec "$@"
