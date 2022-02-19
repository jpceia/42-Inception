
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
	sudo docker rm -f $(sudo docker ps -a -q) 2> /dev/null || echo -n ""
	sudo docker volume rm $(sudo docker volume ls -q) 2> /dev/null || echo -n ""
	sudo rm -rf $(WP_VOLUME_DIR)
	sudo rm -rf $(DB_VOLUME_DIR)

# cleans images
fclean: clean
	sudo docker rmi $(sudo docker images -a -q) || echo -n ""
	sudo docker system prune --all --force --volumes

re: fclean all

host:
	sudo echo "127.0.0.1 ${DOMAIN_NAME}" >> /etc/hosts 
