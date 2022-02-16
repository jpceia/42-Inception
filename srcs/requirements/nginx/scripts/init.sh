sed -i "s/\$DOMAIN_NAME/${DOMAIN_NAME}/g" /etc/nginx/sites-available/nginx.conf
nginx -g 'daemon off;'