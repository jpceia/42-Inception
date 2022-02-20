
if [ -d "/var/lib/mysql/wordpress" ];
then
    echo "Wordpress database already exists"
else
    echo "Setting wordpress database..."
    envsubst < query.sql | mysqld --user=root --skip-password
    echo "Setting root pwd..."
    envsubst < set_root_pwd.sql | mysqld --user=root --skip-password
    echo "Setup finished"
fi

mysqld_safe
