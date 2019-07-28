./stop_docker.sh
docker rm $(docker ps -aq)
docker image rm dstaflund/prediction:1.0