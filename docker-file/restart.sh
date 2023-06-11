#!/bin/sh

#ini restart aapanel
/www/server/mysql/scripts/mysql_install_db --user=mysql
/etc/init.d/mysqld start
/etc/init.d/php-fpm-74 start
/etc/init.d/php-fpm-82 start
/etc/init.d/redis start
/etc/init.d/pure-ftpd start
bt 1
#end restart aapanel