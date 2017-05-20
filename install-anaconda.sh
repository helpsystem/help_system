#!/bin/bash
echo "$1"
username="$1"
mkdir -p /home/$username/install-software/anaconda
wget -O /home/$username/install-software/anaconda/Anaconda3-4.3.1-Linux-x86_64.sh http://download1698.mediafireuserdownload.com/xsv2aotg9omg/il76o447ybopeny/Anaconda3-4.3.1-Linux-x86_64.sh
cd /home/$username/install-software/anaconda
bash Anaconda3-4.3.1-Linux-x86_64.sh -b


