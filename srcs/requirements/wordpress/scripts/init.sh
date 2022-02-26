echo "Waiting for Redis server to be available..."

while !(ping redis -c 1)
do
    sleep 1
done

echo "...Redis server is available now"

echo "Waiting for MariaDB server to be available..."

while !(ping mariadb -c 1)
do
    sleep 1
done

echo "...MariaDB server is available now"

sleep 5

if !(wp core is-installed)
then
    echo "Installing wordpress"
    wp core install \
        --url=$DOMAIN_NAME \
        --title=$WP_PAGE_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --color
    echo "Installing and activating redis-cache plugin"
    wp plugin install redis-cache
    wp plugin activate redis-cache
    wp redis enable
    echo "Installation complete"
fi

unset DOMAIN_NAME
unset WP_PAGE_TITLE
unset WP_ADMIN_USER
unset WP_ADMIN_PASSWORD
unset WP_ADMIN_EMAIL

wp server --host=wordpress --port=9000
