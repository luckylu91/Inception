LOCATION_OPT = --project-directory srcs/

all:
	docker-compose $(LOCATION_OPT) -- up -d

fclean:
	docker-compose $(LOCATION_OPT) -- down

re:
	docker-compose $(LOCATION_OPT) -- up --build -d

