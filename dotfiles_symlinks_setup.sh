#!/bin/bash

#This script copies several dotfiles to a .dotfiles dir
#Then replaces the originals with symlinks
#The .dotfiles directory will then be maintained by git

if [ ! -d $HOME/dotfiles ]; then
    mkdir $HOME/dotfiles
else
    echo "$HOME/dotfiles already exists"
fi

if [ ! -d $HOME/dotfiles/.config ]; then
    mkdir $HOME/dotfiles/.config
else
    echo "$HOME/dotfiles/.config already exists"
fi

#IF YOU KEEP ANY USERNAME PASSWORDS in your .ssh/config files
#DO NOT BACK THEM UP TO GITHUB!

if [ ! -d $HOME/dotfiles/.ssh ]; then
    mkdir $HOME/dotfiles/.ssh ]
else
    echo "$HOME/dotfiles/.ssh already exists"
fi

#listing files
listoffiles=".vimrc .config/kcminputrc .ssh/config"

for dots in $listoffiles; do
    cp $HOME/$dots $HOME/dotfiles/$dots
done

#DANGEROUS PART
echo "This next part is dangerous so make sure"
echo "That all the files were copied to the .dotfiles"
echo "directory before running this part"
echo "do you want to continue? Select the number next to your choice"

select choice in yes no; do
    if [ $choice = "yes" ]; then
        break
    elif [ $choice = "no"; then
        echo "make sure your files are in the .dotfiles dir"
        echo "then rerun the script"
        exit
    else
        echo "select the number next to your choice"
    fi
done


for origfiles in $listoffiles; do
    rm $HOME/$origfiles
done

for links in $listoffiles; do
    ln -s $HOME/dotfiles/$links $HOME/$links
done
