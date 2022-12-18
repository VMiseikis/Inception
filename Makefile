all:
	mkdir -p ./srcs/requirements/mariadb/database
	mkdir -p ./srcs/requirements/wordpress/content
	sudo docker-compose -f ./srcs/docker-compose.yml up -d

up:
	sudo docker-compose -f ./srcs/docker-compose.yml up -d

down:
	sudo docker-compose -f ./srcs/docker-compose.yml down

clean_volumes:
	sudo rm -rf ./srcs/requirements/mariadb/database
	sudo rm -rf ./srcs/requirements/wordpress/content

fclean:
	sudo docker-compose -f ./srcs/docker-compose.yml down --volumes --rmi all
	sudo rm -rf ./srcs/requirements/mariadb/database
	sudo rm -rf ./srcs/requirements/wordpress/content

re: fclean all

nginx:
	sudo docker-compose -f ./srcs/docker-compose.yml build nginx

wordpress:
	sudo docker-compose -f ./srcs/docker-compose.yml build wordpress

mariadb:
	sudo docker-compose -f ./srcs/docker-compose.yml build mariadb

build:
	sudo docker-compose -f ./srcs/docker-compose.yml build