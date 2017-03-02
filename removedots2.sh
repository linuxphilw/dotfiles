#!/bin/bash

#This script removes the old dotfiles, MAKE SURE TO RUN backup_orig_dots.sh first
backupdir=".dotfiles_orig"
sourcedir="dotfiles"
if [ ! -d $HOME/$backupdir -o ! -d $HOME/$sourcedir ]; then
    echo "MAKE SURE to run backup_orig_dots.sh BEFORE you run this script"
	echo "If you changed the $backupdir in that script you need to make sure"
	echo "to set it to the same path in THIS file"
	exit
fi

#listing files
listoffiles=".vimrc .config/kcminputrc"

#DANGEROUS PART
echo "This next part is dangerous so make sure"
echo "That all the files were copied to the .dotfiles"
echo "directory before running this part"
echo "do you want to continue? Select the number next to your choice"

select choice in yes no; do
    if [ $choice = "yes" ]; then
        break
    elif [ $choice = "no" ]; then
        echo "Note, for the final linking script to work, you will eventually have to do this part"
        echo "When you are ready, re run this script and choose the numbe for yes "
        exit
    else
        echo "select the number next to your choice"
    fi
done


for origfiles in $listoffiles; do
    rm $HOME/$origfiles
done

