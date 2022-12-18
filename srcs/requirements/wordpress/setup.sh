#!/bin/sh
cd /var/www/html/

wp core download --allow-root

wp core config  --dbhost=$DB_HOST	\
				--dbname=$DB_NAME 	\
				--dbuser=$DB_USER 	\
				--dbpass=$DB_PASS	\
				--dbprefix=wp_ 		\
				--allow-root

wp core install --url=$WP_URL 					\
				--title=$WP_TITLE 				\
				--admin_user=$WP_ROOT 			\
				--admin_password=$WP_ROOT_PASS 	\
				--admin_email=$WP_ROOT_MAIL 	\
				--allow-root 

wp user create  $WP_USER $WP_USER_MAIL 		\
				--role=author 				\
				--user_pass=$WP_USER_PASS	\
				--allow-root

cd -
php-fpm7.3 -F
