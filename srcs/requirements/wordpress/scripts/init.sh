sed -i "s/\$MYSQL_USER/${MYSQL_USER}/g" wp-config.php
sed -i "s/\$MYSQL_PASSWORD/${MYSQL_PASSWORD}/g" wp-config.php

php -S 0.0.0.0:9000 -t wordpress