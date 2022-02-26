echo "Waiting for DB server to be available..."

while !(ping mariadb -c 1)
do
    sleep 1
done

echo "...Server is available now"

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
fi

wp server --host=wordpress --port=9000
