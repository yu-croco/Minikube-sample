#!/bin/sh
minikube config set cpus 6
minikube config set memory 16384
minikube config set disk-size 50GB
minikube delete
minikube start --vm-driver=virtualbox
minikube ssh
sudo sysctl fs.inotify.max_user_watches=1048576
exit 0
