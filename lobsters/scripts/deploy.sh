docker pull mariadb:latest
docker pull efthymiosh/lobsters
kubectl create -f ../deployments/mariadb-deployment.yaml
kubectl create -f ../services/mariadb-service.yaml
kubectl create -f ../deployments/lobsters-deployment.yaml
kubectl create -f ../services/lobsters-service.yaml
