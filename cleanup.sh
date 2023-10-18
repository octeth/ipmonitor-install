#!/bin/bash
cd /opt/ipmonitor || exit
sudo -E docker compose down
sudo docker volume rm ipmonitor_ipmonitor-mysql
sudo rm -rf /opt/ipmonitor
sudo apt-get remove -y -qq docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-ce-rootless-extras docker-buildx-plugin
