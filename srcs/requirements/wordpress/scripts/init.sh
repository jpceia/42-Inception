sed -i "s/\$MYSQL_ADMIN_USER/${MYSQL_ADMIN_USER}/g" wp-config.php
sed -i "s/\$MYSQL_ADMIN_PASSWORD/${MYSQL_ADMIN_PASSWORD}/g" wp-config.php

php -S 0.0.0.0:9000 -t wordpress