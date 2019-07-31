#!/usr/bin/env bash

dockerpath=dstaflund/prediction:1.0

kubectl run prediction --image=docker.io/${dockerpath} --labels="app=prediction"
kubectl get pods

PREDICTION_POD=$(kubectl get pods -l app=prediction -o jsonpath='{.items[0].metadata.name}')
kubectl port-forward "${PREDICTION_POD}" 8000:80


