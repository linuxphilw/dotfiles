#!/bin/bash

#This script sets up links to the dotfiles downloaded from github
#You must run the remove and backup scripts first
#The .dotfiles directory will then be maintained by git
sourcedir=dotfiles
#listing files
listoffiles=".vimrc .config/kcminputrc .ssh/config"

for links in $listoffiles; do
    ln -s $HOME/$sourcedir/$links $HOME/$links
done
