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
DD_AGENT_MAJOR_VERSION=7 DD_API_KEY=${DD_API_KEY} DD_INSTALL_ONLY=true DD_LOGS_ENABLED=true DD_HOSTNAME=${HOSTNAME_BASE}.agent7-logs bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)"

echo "copying .bashrc settings"
cp ~/data/bashrc.txt ~/.bashrc

LOGFILE="(([^\.\/]*)\.txt)$"
for file in ~/data/logfiles/*.txt; do
    if [[ $file =~ $LOGFILE ]]
    then
        FILENAME="${BASH_REMATCH[1]}"
        FILE="${BASH_REMATCH[2]}"
        echo "Converting $FILENAME to log file."
        sudo cp ~/data/logfiles/$FILENAME /var/log/datadog/$FILE.log
    fi
done

CONF_FILE="\/(([^\.\/]*)\.conf)$"
for file in ~/data/logfiles/*.conf; do
    if [[ $file =~ $CONF_FILE ]]
    then
        FILENAME="${BASH_REMATCH[1]}"
        FILE="${BASH_REMATCH[2]}"
        echo "Making conf.d directory for $FILENAME."
        sudo mkdir -p /etc/datadog-agent/conf.d/$FILE.d
        echo "Converting $FILENAME to conf.d file."
        sudo cp ~/data/logfiles/$FILENAME /etc/datadog-agent/conf.d/$FILE.d/conf.yaml
    fi
done

# sudo service datadog-agent start
