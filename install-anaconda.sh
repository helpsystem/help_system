#!/bin/bash
echo "$1"
username="$1"
mkdir -p /home/$username/install-software/anaconda
wget -O /home/$username/install-software/anaconda/Anaconda3-4.3.1-Linux-x86_64.sh ftp://192.168.99.6/Software/soft-for-linux64/Anaconda3-4.3.1-Linux-x86_64.sh
cd /home/$username/install-software/anaconda
bash Anaconda3-4.3.1-Linux-x86_64.sh -b


