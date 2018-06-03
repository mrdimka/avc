Task 1
======

I have used a vagrant ubuntu 16.04 box with just base OS installed.
All commands were executed as root instead of sudo execution.

## Install Docker

First of all make sure you don't have older versions of docker installed
```
# apt-get remove docker docker-engine docker.io
```
Install prerequisites 
```
# apt-get update
# apt-get install apt-transport-https ca-certificates curl software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# apt-key fingerprint 0EBFCD88
# add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# apt-get update
# apt-get install docker-ce
```
## Install minikube
```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.27.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
```

## Install kubectl
One of the ways to install kubectl is to use the the official kubernetes apt repository 

```
# curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
# cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
# apt-get update
# apt-get install -y kubectl
```

## Start minicube
Since I have been using vagrant with virtualbox provider I thought the wise thing to do was to start minikube with vm-driver none.

```
minikube start --vm-driver=none
```

## Check whether you have a working kubernets cluster

```
# kubectl cluster-info
Kubernetes master is running at https://10.0.2.15:8443
KubeDNS is running at https://10.0.2.15:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```
```
# kubectl get services --namespace kube-system
NAME                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)         AGE
kube-dns               ClusterIP   10.96.0.10       <none>        53/UDP,53/TCP   3m
kubernetes-dashboard   NodePort    10.104.217.206   <none>        80:30000/TCP    3m
```

```
# kubectl get pods --all-namespaces
NAMESPACE     NAME                                    READY     STATUS    RESTARTS   AGE
kube-system   etcd-minikube                           1/1       Running   0          4m
kube-system   kube-addon-manager-minikube             1/1       Running   0          3m
kube-system   kube-apiserver-minikube                 1/1       Running   0          3m
kube-system   kube-controller-manager-minikube        1/1       Running   0          4m
kube-system   kube-dns-86f4d74b45-vtnnt               3/3       Running   0          4m
kube-system   kube-proxy-jh8m8                        1/1       Running   0          4m
kube-system   kube-scheduler-minikube                 1/1       Running   0          4m
kube-system   kubernetes-dashboard-5498ccf677-jsndf   1/1       Running   0          4m
kube-system   storage-provisioner                     1/1       Running   0          4m
```


## Links

https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/ 

https://github.com/kubernetes/minikube/releases 

https://kubernetes.io/docs/tasks/tools/install-kubectl/


