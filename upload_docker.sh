#!/usr/bin/env bash

dockerpath=dstaflund/prediction:1.0

echo "Docker ID and Image: $dockerpath"
cat ./password.txt | docker login -u dstaflund --password-stdin
docker tag ${dockerpath} ${dockerpath}
docker push ${dockerpath}
