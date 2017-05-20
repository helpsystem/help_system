#!/bin/bash

echo "$1"
username="$1"

echo "============Create Folder Slack==============="
mkdir -p /home/$username/install-software/slack
cd /home/$username/install-software/slack

echo "===============Download Slack======================="

wget -O /home/$username/install-software/slack/slack-desktop-2.5.2-amd64.deb http://download2098.mediafireuserdownload.com/0mt40pind86g/sllzr3gzd47iz3i/slack-desktop-2.5.2-amd64.deb

#echo "===============Download Slack======================="
#sudo dpkg update
#sudo dpkg upgrade

echo "=================Install Slack====================="

sudo apt-get install apt-transport-https libappindicator1 -y
sudo dpkg --install slack-desktop-2.5.2-amd64.deb -y


