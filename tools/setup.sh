#!/bin/bash

# DOCKER ENGINE

## Uninstall old versions
sudo apt-get remove docker docker.io containerd runc > /dev/null

if command -v docker > /dev/null
then
	echo "docker already installed"
else
	## Install using convenience script
	curl -fsSL https://get.docker.com -o get-docker.sh
	sh ./get-docker.sh

	## install rootless docker
	sudo apt-get install uidmap
	dockerd-rootless-setuptool.sh install
	sudo chown $USER /var/run/docker.sock
	rm ./get-docker.sh
fi

# DOCKER COMPOSE

if command -v docker-compose > /dev/null
then
	echo "docker-compose already installed"
else
	sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	sudo curl -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
fi

# SETUP HOST
DOMAIN_NAME=$1
if [ -n "${DOMAIN_NAME}" ]
then
	if (cat /etc/hosts | grep ${DOMAIN_NAME} >/dev/null);
	then
		echo "domain '${DOMAIN_NAME}' already set up in /etc/hosts"
	else
		echo "127.0.0.1	${DOMAIN_NAME}" >> /etc/hosts
		echo "Domain '${DOMAIN_NAME}' added to /etc/hosts"
	fi
fi
