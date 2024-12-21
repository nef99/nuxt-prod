

## Production in Nuxt with docker and swarm:

```bash

# start swarm
docker swarm init

# build image in docker
docker build -t web_app:latest .

#Deploy the stack:
docker stack deploy -c docker-compose.yml nuxt_stack

#Updated changes 
docker build -t web_app:latest .

#Force the service to update with the new image:
docker service update --force nuxt_stack_web_app

#(Optional) If you changed the docker-compose.yml, update the entire stack
docker stack deploy -c docker-compose.yml nuxt_stack


#Check the services:
docker service ls