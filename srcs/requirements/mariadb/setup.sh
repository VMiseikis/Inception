#!/bin/bash

service mysql start

if [ ! -d /var/lib/mysql/$DB_NAME ] ; then

mysql --no-defaults -u root -e "								\
	CREATE DATABASE $DB_NAME;									\
	CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';		\
	GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';		\
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';\
	FLUSH PRIVILEGES;"

fi

sleep 1

mysqladmin -p$DB_ROOT_PASS shutdown

mysqld_safe
