
#!/bin/bash

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod 755 kubectl 
mv kubectl bin

#### Firt RMS node ####
# Environment prep.
mkdir -p /etc/rancher/rke2
#####
# /etc/rancher/rke2/config.yaml

cat << EOF > /etc/rancher/rke2/config.yaml
token: c0k3z3r0-is-my-shared-secret
tls-san:
- rms.geekosoup.com

ls -l /etc/rancher/rke2/

curl -sfL https://get.rke2.io | sh -
systemctl enable rke2-server.service
systemctl start rke2-server.service

# Prepping for kubctl
mkdir -p ~/.kube 
cat /etc/rancher/rke2/rke2.yaml >  ~/.kube/config
chmod go-r ~/.kube/config

