echo "Waiting for MariaDB server to be available..."

while !(mysql -h"${DB_HOST}" -D"${DB_NAME}" -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" -e';')
do
    sleep 1
done

echo "...MariaDB server is available now"

if [[ ! -f wp-config.php ]]
then
    echo "Setting up wordpress config file..."
    wp config create \
        --dbname=$DB_NAME \
        --dbhost=$DB_HOST \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --extra-php < wp-extra-config.php
fi

if !( wp core is-installed )
then
    echo "Installing wordpress..."
    wp core install \
        --url=$DOMAIN_NAME \
        --title=$WP_PAGE_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --color
fi

if !( wp plugin is-installed redis-cache )
then
    echo "Installing redis-cache plugin..."
    wp plugin install redis-cache
fi

if !( wp plugin is-active redis-cache )
then
    echo "Activating redis-cache plugin..."
    wp plugin activate redis-cache
fi

if !( wp redis status | grep "Conected" )
then
    echo "Enabling redis..."
    wp redis enable
fi

echo "Setup complete :)"

unset DOMAIN_NAME
unset DB_HOST
unset DB_NAME
unset MYSQL_USER
unset MYSQL_PASSWORD
unset WP_PAGE_TITLE
unset WP_ADMIN_USER
unset WP_ADMIN_PASSWORD
unset WP_ADMIN_EMAIL

exec "$@"
