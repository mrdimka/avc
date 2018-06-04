 apt-get update
 apt-get install apt-transport-https ca-certificates curl software-properties-common -y
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
 apt-key fingerprint 0EBFCD88
 add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
 apt-get update
 apt-get install docker-ce -y
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.27.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
 cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update
apt-get install -y kubectl
