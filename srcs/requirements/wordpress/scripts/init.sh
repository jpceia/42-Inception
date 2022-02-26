if !(wp core is-installed)
then
    wp core install \
        --url=$DOMAIN_NAME \
        --title=$WP_PAGE_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --color
fi

wp server --host=wordpress --port=9000
