#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

docker build --tag dstaflund/prediction:1.0 .
docker images --all
docker run -it -p 8000:80 dstaflund/prediction:1.0 bash
