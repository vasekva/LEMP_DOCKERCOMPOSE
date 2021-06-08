up:
	docker-compose -f srcs/docker-compose.yml up --build

down:
	docker-compose -f srcs/docker-compose.yml down
ps:
	docker-compose -f srcs/docker-compose.yml ps

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q)

re: clean
	docker-compose -f srcs/docker-compose.yml up --build

.PHONY: build stop re clean