LOC_OPTION = --project-directory srcs/
VOLUMES_HOST = /home/lzins/data/wordpress_files /home/lzins/data/wordpress_db

all: $(VOLUMES_HOST)
	sudo bash srcs/add_localhost_name.sh
	sudo docker-compose $(LOC_OPTION) -- up

$(VOLUMES_HOST):
	mkdir -p $@

build:
	sudo docker-compose $(LOC_OPTION) -- up --build

clean:
	sudo docker-compose $(LOC_OPTION) -- down

fclean:
	sudo docker-compose $(LOC_OPTION) -- down
	sudo docker-compose $(LOC_OPTION) -- rm -fsv
	sudo docker rmi -f inception_wordpress inception_db inception_nginx
	sudo rm -rf $(VOLUMES_HOST)

re: fclean all

cdb:
	sudo docker attach inception_db_1
cwo:
	sudo docker attach inception_wordpress_1
cng:
	sudo docker attach inception_nginx_1

emptycache:
	sudo docker system prune -a

.PHONY: all build clean fclean re emptycache
