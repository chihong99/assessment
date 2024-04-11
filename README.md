# word-counter
--------------

## Prepare Environment
1. Build local docker image (optional). This docker image is already published on [dockerhub](https://hub.docker.com/r/chihong888/word-counter).
```
cd app
docker build -t chihong888/word-counter .
```

2. Setup minikube environment.
```
minikube start --drive=hyperv
minikube addons enable ingress
minikube addons enable ingress-dns
```

3. Deploy helm chart application onto minikube.
```
helm install word-counter .
```
