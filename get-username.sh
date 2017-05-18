#!/bin/bash


#read -p "Enter User for sudo: " sudoUSR
#echo $sudoUSR #| sudo -S apt-get update

#read -s -p "Enter Password User for sudo: " sudoPW
#echo $sudoPW | sudo -S apt-get update

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
		useradd -m -p $pass $username
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
	fi
else
	echo "Only root may add a user to the system"
	exit 2
fi

sudo apt-get update 
#su $username
