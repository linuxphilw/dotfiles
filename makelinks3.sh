#!/bin/bash
#set -o xtrace
#This script sets up links to the dotfiles downloaded from github
#You must run the remove and backup scripts first
#The .dotfiles directory will then be maintained by git
#you can just do:   git fetch
sourcedir=dotfiles
#listing files
listoffiles=".vimrc .config/kcminputrc"

for links in $listoffiles; do
    ln -s $HOME/$sourcedir/$links $HOME/$links
done

if [ ! -f $HOME/.ssh/config ]; then
	touch $HOME/.ssh/config
else
    echo ".ssh/config already exists"
fi

sshtest=`grep -A 1 "HOST *" $HOME/.ssh/config | grep ServerAliveInterval | wc -l`

if [ "$sshtest" -ne 1 ]; then
    echo "HOST *" >> $HOME/.ssh/config
    echo "ServerAliveInterval 120" >> $HOME/.ssh/config
else 
    echo "You probably already have the ServerAliveInterval set in your .ssh/config"
fi


