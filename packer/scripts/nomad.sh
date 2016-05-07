#!/bin/bash

# Download Nomad
echo Fetching Nomad...
cd /tmp/
curl -sSL https://releases.hashicorp.com/nomad/0.3.2/nomad_0.3.2_linux_amd64.zip -o nomad.zip

echo Installing Nomad...
unzip nomad.zip
sudo chmod +x nomad
sudo mv nomad /usr/bin/nomad
sudo mkdir -p /etc/nomad.d
sudo chmod a+w /etc/nomad.d
