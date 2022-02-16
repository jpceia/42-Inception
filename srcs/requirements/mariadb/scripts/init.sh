service mysql start

#envsubst < query.sql | mysql -u root --skip-password
#rm -f query.sql
#service mysql stop
# mysqld_safe
if [[ $(mysql -u root --skip-password -e "SELECT * FROM information_schema.tables WHERE table_schema='wordpress' LIMIT 1") ]]
then
    echo "Wordpress database already exists"
else
    echo "Setting wordpress database..."
    envsubst < query.sql | mysql -u root --skip-password
    echo "Setup finished"
fi

tail -f