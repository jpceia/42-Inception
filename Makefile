
NAME	= inception
DIR		= srcs
FLAGS	= -p $(NAME) -f $(DIR)/docker-compose.yml

WP_VOLUME_DIR	= $(shell cat $(DIR)/.env | grep WP_VOLUME_DIR | cut -d "=" -f2)
DB_VOLUME_DIR	= $(shell cat $(DIR)/.env | grep DB_VOLUME_DIR | cut -d "=" -f2)
DOMAIN_NAME		= $(shell cat $(DIR)/.env | grep DOMAIN_NAME | cut -d "=" -f2)

all: $(NAME)

$(NAME): run

build:
	mkdir -p $(WP_VOLUME_DIR)
	mkdir -p $(DB_VOLUME_DIR)
	docker-compose $(FLAGS) build

run: build
	docker-compose $(FLAGS) up --detach

stop:
	docker-compose $(FLAGS) stop

logs:
	docker-compose $(FLAGS) logs --timestamps

clean: stop
	@echo "Deleting containers..."
	@docker rm -f $(shell docker ps -aq --filter name=$(NAME)) 2>/dev/null || echo -n ""
	@echo "Deleting networks..."
	@docker network rm $(shell docker network ls -q --filter name=$(NAME)) 2>/dev/null || echo -n ""
	@echo "Deleting volumes..."
	@docker volume rm $(shell docker volume ls -q --filter name=$(NAME)) 2>/dev/null || echo -n ""
	sudo rm -rf $(WP_VOLUME_DIR)
	sudo rm -rf $(DB_VOLUME_DIR)

# cleans images
fclean: clean
	@echo "Deleting images..."
	docker rmi $(shell sudo docker images -aq --filter name=$(NAME)) 2>/dev/null || echo -n ""
	#docker system prune --all --force --volumes

re: fclean all

host:
	sudo echo "127.0.0.1 ${DOMAIN_NAME}" >> /etc/hosts 
