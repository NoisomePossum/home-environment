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
DD_AGENT_MAJOR_VERSION=7 DD_API_KEY=${DD_API_KEY} DD_INSTALL_ONLY=true DD_HOSTNAME=${HOSTNAME_BASE}.agent7-logs bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)"

echo "Configuring dd-agent"
	sudo sed -i "s/# logs_enabled: false/logs_enabled: true/g" /etc/datadog-agent/datadog.yaml

echo "copying .bashrc settings"
cp ~/data/bashrc.txt ~/.bashrc

sudo service datadog-agent start

# Iterate through all .txt files in VAGRANT_HOME/data/logfiles/
# Capture just the filename without the filepath and also
# get the filename without the extension
LOGFILE="\/home\/vagrant\/data\/logfiles\/(([^\.\/]*)\.txt)$"
for file in ~/data/logfiles/*.txt; do
    if [[ $file =~ $LOGFILE ]]
    then
        # BASH_REMATCH is an array that captures the previous regex as index 0
        # and all capture groups as indexes 1 - x
        FILENAME="${BASH_REMATCH[1]}"
        FILE="${BASH_REMATCH[2]}"
        echo "Converting $FILENAME to log file."
        sudo cp ~/data/logfiles/$FILENAME /var/log/datadog/$FILE.log
    fi
done

# Iterate through all .conf files in VAGRANT_HOME/data/logfiles/
# Capture just the filename without the filepath and also
# get the filename without the extension
CONF_FILE="\/home\/vagrant\/data\/logfiles\/(([^\.\/]*)\.conf)$"
for file in ~/data/logfiles/*.conf; do
    if [[ $file =~ $CONF_FILE ]]
    then
        # BASH_REMATCH is an array that captures the previous regex as index 0
        # and all capture groups as indexes 1 - x
        FILENAME="${BASH_REMATCH[1]}"
        FILE="${BASH_REMATCH[2]}"
        echo "Making conf.d directory for $FILENAME."
        sudo mkdir -p /etc/datadog-agent/conf.d/$FILE.d
        echo "Converting $FILENAME to conf.d file."
        sudo cp ~/data/logfiles/$FILENAME /etc/datadog-agent/conf.d/$FILE.d/conf.yaml
    fi
done
