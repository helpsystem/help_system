#!/bin/bash

echo "$1"
username="$1"
sudo apt-get update
mkdir -p /home/$username/install-software/idea
wget -O /home/$username/install-software/idea/ideaIU-2017.1.2.tar.gz ftp://192.168.99.6/Software/soft-for-linux64/ideaIU-2017.1.2.tar.gz
tar -xvzf /home/$username/install-software/idea/ideaIU-2017.1.2.tar.gz -C /home/$username/install-software/idea


cd /home/$username/install-software/idea/idea-IU-171.4249.39/bin
sudo ./idea.sh & 

