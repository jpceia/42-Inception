
NAME	= inception
DIR		= srcs
FLAGS	= -p $(NAME) -f $(DIR)/docker-compose.yml
# --tls

all: $(NAME)

$(NAME): build run

build:
	sudo docker-compose $(FLAGS) build

run:
	sudo docker-compose $(FLAGS) run

clean:
	@sudo docker rm srcs_nginx_1 || echo "" > /dev/null
	@sudo docker rm srcs_mariadb_1 || echo "" > /dev/null
	@sudo docker rm srcs_wordpress_1 || echo "" > /dev/null

# Cleans everything
fclean: clean
	sudo docker system prune -a

re: fclean all