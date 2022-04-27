all : up

# sudo sed -i "s/localhost/asgaulti.42.fr/g" /etc/hosts

# build et run les containers (cmd docker-compose up)
up :	
			docker-compose -f srcs/docker-compose.yml up

# stop : stop running containers without removing them
stop :	
			docker-compose -f srcs/docker-compose.yml stop

#  rm : stop et efface les containers
rm :	stop
		docker system prune -a
		docker volume prune

.PHONY:	all build up stop rm