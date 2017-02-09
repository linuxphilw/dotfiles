#!/bin/bash

#This script backs up some of your dotfiles into a
#backup directory

backupdir=.dotfiles_orig

if [ ! -d $HOME/$backupdir ]; then
    mkdir $HOME/$backupdir
else
    echo "$HOME/$backupdir already exists"
fi

if [ ! -d $HOME/$backupdir/.config ]; then
    mkdir $HOME/$backupdir/.config
else
    echo "$HOME/$backupdir/.config already exists"
fi

echo "If you keep any username or passwords in your .ssh/config file"
echo "SKIP this part! Or they could end up on github!"
select sshdo in yes no; do
    if [ $sshdo = "yes" ]; then
		if [ ! -d $HOME/$backupdir/.ssh ]; then
			mkdir $HOME/$backupdir/.ssh
		else
			echo "$HOME/$backupdir/.ssh already exists"
		fi
		if [ -e $HOME/$backupdir/.ssh/config ]; then
			echo "$HOME/$backupdir/.ssh/config already exists"
		else
			if [ -s $HOME/.ssh/config ]; then
				cp $HOME/.ssh/config $HOME/$backupdir/.ssh/
			else
				echo ".ssh/config file empty or does not exist"
			fi
		fi
        break
    elif [ $sshdo = "no" ]; then
        echo "Skipping backing up your .ssh/config"
        break
    else
        echo "select the number next to your choice"
    fi
done


#listing files
listoffiles=".vimrc .config/kcminputrc"

for dots in $listoffiles; do
    cp $HOME/$dots $HOME/dotfiles/$dots
done


