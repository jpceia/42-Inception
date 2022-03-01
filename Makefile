
NAME	= inception
DIR		= srcs
FLAGS	= -p $(NAME) -f $(DIR)/docker-compose.yml

VOLUME_DIRS		= $(shell cat $(DIR)/.env | grep VOLUME_DIR | cut -d "=" -f2)
DOMAIN_NAME		= $(shell cat $(DIR)/.env | grep DOMAIN_NAME | cut -d "=" -f2)

all: $(NAME)

$(NAME): run

build:
	mkdir -p $(VOLUME_DIRS)
	chown -R $(USER) $(VOLUME_DIRS)
	sudo docker-compose $(FLAGS) build

run: build
	sudo docker-compose $(FLAGS) up --detach

stop:
	sudo docker-compose $(FLAGS) stop

logs:
	sudo docker-compose $(FLAGS) logs --timestamps

clean: stop
	@echo "Deleting containers..."
	@sudo docker rm -f $(shell sudo docker ps -aq --filter name=$(NAME)) 2>/dev/null || echo -n ""
	@echo "Deleting networks..."
	@sudo docker network rm $(shell sudo docker network ls -q --filter name=$(NAME)) 2>/dev/null || echo -n ""
	@echo "Deleting volumes..."
	@sudo docker volume rm $(shell sudo docker volume ls -q --filter name=$(NAME)) 2>/dev/null || echo -n ""
	sudo rm -rf $(VOLUME_DIRS)

# cleans images
fclean: clean
	@echo "Deleting images..."
	sudo docker rmi $(shell sudo docker images -aq) 2>/dev/null || echo -n ""

re: fclean all

setup:
	sudo bash tools/setup.sh ${DOMAIN_NAME}
