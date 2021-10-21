LOC_OPTION = --project-directory srcs/

all:
	docker-compose $(LOC_OPTION) -- up

build:
	docker-compose $(LOC_OPTION) -- up --build

clean:
	docker-compose $(LOC_OPTION) -- down

fclean:
	docker-compose $(LOC_OPTION) -- down
	docker-compose $(LOC_OPTION) -- rm -fsv
	docker volume rm -f inception_wordpress_db inception_wordpress_files
	docker rmi -f inception_wordpress inception_db inception_nginx

re: fclean all

emptycache:
	docker system prune -a

.PHONY: all build clean fclean re emptycache
