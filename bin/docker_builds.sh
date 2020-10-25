#!/usr/bin/env bash
docker build -t minikube-golang -f ./app/golang/Dockerfile .
docker build -t minikube-nodejs -f ./app/nodejs/Dockerfile .
