up:
	docker-compose -f ./srcs/docker-compose.yml up --build
down:
	docker-compose -f ./srcs/docker-compose.yml down
ps:
	docker-compose -f ./srcs/docker-compose.yml ps


db:
	docker container rm mariadb
	rm -rf /Users/jberegon/data/database/*
wp:
	docker container rm wordpress
	rm -rf /Users/jberegon/data/wordpress/*


exec_db:
	docker-compose -f srcs/docker-compose.yml exec mariadb bash
exec_nginx:
	docker-compose -f srcs/docker-compose.yml exec nginx bash
exec_wp:
	docker-compose -f srcs/docker-compose.yml exec wordpress bash
exec_ftp:
	docker-compose -f srcs/docker-compose.yml exec ftpd-server bash
exec_redis:
	docker-compose -f srcs/docker-compose.yml exec redis_cache bash
exec_adm:
	docker-compose -f srcs/docker-compose.yml exec adminer bash
exec_page:
	docker-compose -f srcs/docker-compose.yml exec page bash

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
	rm -rf /Users/jberegon/data/usr/*
	rm -rf /Users/jberegon/data/html/*
re: clean
	rm -rf /Users/jberegon/data/wp/*
	rm -rf /Users/jberegon/data/database/*
	docker-compose -f srcs/docker-compose.yml up --build

.PHONY: build stop re clean