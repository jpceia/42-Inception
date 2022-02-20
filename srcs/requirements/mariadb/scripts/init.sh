service mysql start

#envsubst < query.sql | mysql -u root --skip-password
#rm -f query.sql
#service mysql stop
# mysqld_safe
if [ -d "/var/lib/mysql/wordpress" ];
then
    echo "Wordpress database already exists"
else
    echo "Setting wordpress database..."
    envsubst < query.sql | mysql -u root --skip-password
    echo "Setup finished"
fi

tail -f
