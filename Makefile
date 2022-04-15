#Regles pour build/run/stop/rm/clean les containers

all :	build up

# sudo sed -i "s/localhost/asgaulti.42.fr/g" /etc/hosts

# build containers a partir du .yml
# --f > ne rend pas la main au user 
# donner le path du fichier de construction (.yml)
# build :	
# 			docker-compose -f srcs/docker-compose.yml build 
#--no-cache

# build et run les containers (cmd docker-compose up)
up :	
			docker-compose -f srcs/docker-compose.yml up

# stop : stop running containers without removing them
stop :	
			docker-compose -f srcs/docker-compose.yml stop

#  rm : stop et efface les containers
rm :	stop
			docker-compose -f srcs/docker-compose.yml rm

.PHONY:	all build up stop rm

# docker build --no-cache requirements/nginx/ -t toto