minikube start --vm-driver=none
minikube addons enable ingress
docker pull mariadb:latest
docker pull efthymiosh/lobsters
kubectl create -f ../deployments/mariadb-deployment.yaml
kubectl create -f ../services/mariadb-service.yaml
sleep 60
kubectl create -f ../deployments/lobsters-deployment.yaml
kubectl create -f ../services/lobsters-service.yaml
kubectl create -f ../services/lobsters-ingress.yaml
