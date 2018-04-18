#!/bin/bash
echo "Setting up your global git settings"
echo "Do you wish this to be set globally for your user?"
select choice in global local; do
    if [ $choice ]; then
        break
    else
        echo "Not a valid choice, choose the number next to your choice"
    fi
done
if [ $choice = "local" ]; then
    global=""
else
    global="--global"
fi
echo "What is your name?"
read yourname
git config $global user.name "$yourname"
echo "What email do you wish to use? (Should match github account if any)"
read email
git config $global user.email $email
echo "What is your username?"
read username
git config $global user.username $username
git config $global color.ui true

echo "The Global settings for your present user account"
git config --global --list
echo "*********************************"
echo "The full settings for your pwd"
echo "These will be different if the directory you are in has its own"
echo "local settings for git"
git config --list
