#!/bin/bash

# make sure to edit the path to what is appropriate for your VM
. ~/.sandbox.conf.sh

echo "Provisioning!"

echo "apt-get updating"
sudo apt-get update
echo "install curl if not there..."
sudo apt-get -y install curl
echo "installing git if not there..."
sudo apt-get -y install git

echo "Installing dd-agent from api_key: ${DD_API_KEY}..."
DD_API_KEY=${DD_API_KEY} DD_INSTALL_ONLY=true DD_LOGS_ENABLED=true DD_HOSTNAME=${HOSTNAME_BASE}.agent6-beta bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)"

echo "copying .bashrc settings"
cp ~/data/bashrc.txt ~/.bashrc

sudo service datadog-agent start
