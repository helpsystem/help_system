#!/bin/bash

# Script to add a user to Linux system
if [ $(id -u) -eq 0 ]; then
	read -p "Enter username : " username
	read -s -p "Enter password : " password
	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$username exists!"
		exit 1
	else
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
	
	#groupadd $username 
	#useradd -m -p $password -g $username $username
		useradd -m -p $pass $username 
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
	fi
else
	echo "Only root may add a user to the system"
	exit 2
fi
	groupadd $username 
	useradd -m -p $password -g $username $username
#groupadd -g $username $username sudo

mkdir /home/$username/install-software
sudo apt-get install sudo -y
adduser $username sudo

#su /$
#su $username &

cp install-anaconda.sh install-git.sh install-java.sh install-docker.sh install-intellijidea.sh install-slack.sh  /home/$username/install-software/
cd /home/$username/install-software

echo CHOWN *********************************************
chown -R $username:$username /home/$username/install-software

chmod a+x install-anaconda.sh install-git.sh install-java.sh install-docker.sh install-intellijidea.sh install-slack.sh

echo ===***===***===***== INSTALL Docker ==***===***===***===***===***===***===***==***==***===***===***===
sudo -u $username -H sh -c "./install-docker.sh $username"

echo ===***===***===***== INSTALL Git ==***===***===***===***===***===***===***==***==***===***===***=== 
sudo -u $username -H sh -c "./install-git.sh $username" 

echo ===***===***===***== INSTALL Anaconda ==***===***===***===***===***===***===***==***==***===***===***=== 
sudo -u $username -H sh -c "./install-anaconda.sh $username" 

echo ===***===***===***== INSTALL Intellijidea ==***===***===***===***===***===***===***==***==***===***===***=== 
sudo -u $username -H sh -c "./install-intellijidea.sh $username" root
sudo firefox -new-window http://us.idea.lanyus.com/

echo ===***===***===***== INSTALL Slack ==***===***===***===***===***===***===***==***==***===***===***=== 
sudo -u $username -H sh -c "./install-slack.sh $username" 

echo ===***===***===***== INSTALL JAVA ==***===***===***===***===***===***===***==***==***===***===***===
sudo -u $username -H sh -c "./install-java.sh $username" 


cd /home/$username/install-software
wget -O /home/$username/install-software/sublime-text_build-3126_amd64.deb Ftp://192.168.99.6/Software/soft-for-linux64/sublime-text_build-3126_amd64.deb
sudo dpkg --install sublime-text_build-3126_amd64.deb 
