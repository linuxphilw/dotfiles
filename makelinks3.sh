#!/bin/bash

#This script sets up links to the dotfiles downloaded from github
#You must run the remove and backup scripts first
#The .dotfiles directory will then be maintained by git
sourcedir=dotfiles
#listing files
listoffiles=".vimrc .config/kcminputrc"

for links in $listoffiles; do
    ln -s $HOME/$sourcedir/$links $HOME/$links
done

if [ ! -f $HOME/.ssh/config ]; then
	touch $HOME/.ssh/config
fi

sshtest=`grep -A 1 "HOST *" | grep ServerAliveInterval | wc -l`


#HOST *
#        ServerAliveInterval 120


