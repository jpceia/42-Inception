
NAME	= inception
DIR		= srcs
FLAGS	= -p $(NAME) -f $(DIR)/docker-compose.yml

WP_VOLUME_DIR	= $(shell cat $(DIR)/.env | grep WP_VOLUME_DIR | cut -d "=" -f2)
DB_VOLUME_DIR	= $(shell cat $(DIR)/.env | grep DB_VOLUME_DIR | cut -d "=" -f2)
DOMAIN_NAME		= $(shell cat $(DIR)/.env | grep DOMAIN_NAME | cut -d "=" -f2)

all: $(NAME)

$(NAME): run

build:
	sudo mkdir -p $(WP_VOLUME_DIR)
	sudo mkdir -p $(DB_VOLUME_DIR)
	sudo docker-compose $(FLAGS) build

run: build
	sudo docker-compose $(FLAGS) up

clean:
	@sudo docker rm $(NAME)_nginx_1 || echo "" > /dev/null
	@sudo docker rm $(NAME)_mariadb_1 || echo "" > /dev/null
	@sudo docker rm $(NAME)_wordpress_1 || echo "" > /dev/null
	@sudo docker network rm $(NAME)_internal
	sudo rm -rf $(WP_VOLUME_DIR)
	sudo rm -rf $(DB_VOLUME_DIR)

# cleans images
fclean: clean
	@sudo docker rmi nginx
	@sudo docker rmi mariadb
	@sudo docker rmi wordpress

host:
	sudo echo "127.0.0.1 ${DOMAIN_NAME}" >> /etc/hosts
