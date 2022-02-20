
if [ -d "/var/lib/mysql/wordpress" ];
then
    echo "Wordpress database already exists"
else
    echo "Setting wordpress database..."
    envsubst < query.sql | mysqld --user=mysql --skip-password
    echo "Setting root pwd..."
    # https://dev.mysql.com/doc/refman/8.0/en/resetting-permissions.html
    envsubst < set_root_pwd.sql | mysqld --user=mysql --skip-password
    echo "Setup finished"
fi

mysqld_safe
