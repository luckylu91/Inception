LOC_OPTION = --project-directory srcs/
VOLUMES_HOST = /home/lzins/data/wordpress_files /home/lzins/data/wordpress_db

all: $(VOLUMES_HOST)
	docker-compose $(LOC_OPTION) -- up

$(VOLUMES_HOST):
	mkdir -p $@

build:
	docker-compose $(LOC_OPTION) -- up --build

clean:
	docker-compose $(LOC_OPTION) -- down

fclean:
	docker-compose $(LOC_OPTION) -- down
	docker-compose $(LOC_OPTION) -- rm -fsv
	docker rmi -f inception_wordpress inception_db inception_nginx

re: fclean all

cdb:
	docker attach inception_db_1
cwo:
	docker attach inception_wordpress_1
cng:
	docker attach inception_nginx_1

emptycache:
	docker system prune -a

.PHONY: all build clean fclean re emptycache
