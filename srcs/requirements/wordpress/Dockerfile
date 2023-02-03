FROM debian:buster

RUN apt-get update  -y && \
	apt-get upgrade -y && \
	apt-get install -y php7.3 php-fpm php-mysqli mariadb-client wget

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
 	chmod +x wp-cli.phar 				&& \
	mv wp-cli.phar /usr/local/bin/wp	&& \
	mkdir /run/php

COPY ./www.conf /etc/php/7.3/fpm/pool.d
COPY ./setup.sh /

CMD ["/bin/bash", "-x", "./setup.sh"]
