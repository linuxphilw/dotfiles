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



#listing files
listoffiles=".vimrc .config/kcminputrc"

for dots in $listoffiles; do
    cp $HOME/$dots $HOME/$backupdir/$dots
done


