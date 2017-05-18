
#!/bin/bash

echo "$1"
username="$1"

sudo apt-get update
sudo apt-get install git-core -y

#Configuring Git

echo '###Congigure Git..'

echo "Enter the Global Username for git:";
read GITUSER
git config --global user.name "${GITUSER}"

echo "Enter the Global Email for Git:";
read GITEMAIL
git config --global user.email "${GITEMAIL}"

echo 'Git has been configured!'
git config --list

