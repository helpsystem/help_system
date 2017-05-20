#!/bin/bash
echo "$1"
username="$1"

mkdir -p /home/$username/install-software/java
cd /home/$username/install-software/java
wget ftp://192.168.99.6/Software/soft-for-linux64/jdk-8u131-linux-x64.tar.gz
cp -r jdk-8u131-linux-x64.tar.gz /home/$username/install-software/java/
cd /home/$username/install-software/java
 

tar xvzf jdk-8u131-linux-x64.tar.gz

sudo update-alternatives --install "/usr/bin/java" "java" "/home/$username/install-software/java/jdk1.8.0_131/bin/java" 1

sudo update-alternatives --install "/usr/bin/javac" "javac" "/home/$username/install-software/java/jdk1.8.0_131/bin/javac" 1

sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/home/$username/install-software/java/jdk1.8.0_131/bin/javaws" 1


sudo update-alternatives --set java /home/$username/install-software/java/jdk1.8.0_131/bin/java 

sudo update-alternatives --set javac /home/$username/install-software/java/jdk1.8.0_131/bin/javac

sudo update-alternatives --set javaws /home/$username/install-software/java/jdk1.8.0_131/bin/javaws 

source /etc/profile
