up:
	docker-compose -f srcs/docker-compose.yml up --build
down:
	docker-compose -f srcs/docker-compose.yml down
ps:
	docker-compose -f srcs/docker-compose.yml ps

db:
	docker container rm mariadb
	rm -rf /Users/jberegon/data/database/*
wp:
	docker container rm wordpress
	rm -rf /Users/jberegon/data/wordpress/*

clean:
	docker stop $$(docker ps -qa); \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
#	docker network rm $$(docker network ls -q) \
	2> /dev/null

cleandir:
	rm -rf /Users/jberegon/data/wp/*
	rm -rf /Users/jberegon/data/database/*

re: clean
	rm -rf /Users/jberegon/data/wp/*
	rm -rf /Users/jberegon/data/database/*
	docker-compose -f srcs/docker-compose.yml up --build

.PHONY: build stop re clean