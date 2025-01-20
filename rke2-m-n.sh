#!/bin/bash

# Environment prep.
mkdir -p /etc/rancher/rke2
#####
# /etc/rancher/rke2/config.yaml

cat << EOF > /etc/rancher/rke2/config.yaml
token: c0k3z3r0-is-my-shared-secret
server: https://172.31.16.245:9345
tls-san:
- 18.201.101.151
- 172.31.16.245
- rms.geekosoup.com
EOF

ls -l /etc/rancher/rke2/

curl -sfL https://get.rke2.io | sh -

systemctl enable rke2-server.service
systemctl start rke2-server.service

cat /var/lib/rancher/rke2/server/node-token
