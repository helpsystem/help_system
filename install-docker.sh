#!/bin/bash
echo "$1"
username="$1"

#SET UP THE REPOSITORY Jessie or Stretch:
sudo apt-get install -y  apt-transport-https ca-certificates curl gnupg2 software-properties-common 
sudo apt-get -f install -y

#Add Docker’s official GPG keecho "$1"y:
curl -fsSL https://download.docker.com/linux/debian/gpg |sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

#Use the following command to set up the stable repository. You always need the stable repository, even if you want to install edge builds as well.
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"


sudo apt-get update 
sudo apt-get install docker-ce -y
sudo apt-cache madison docker-ce


sudo apt-get --yes --force-yes install docker-ce=17.03.0~ce-0~debian-jessie 

