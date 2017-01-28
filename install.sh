#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
NC="\e[39m"

function checkPremissions 
{
   if (( $EUID != 0 )); then
      echo -e $RED"Please run as root"$NC
      exit
   fi
}

function addRepositories
{
   echo -e $GREEN"Adding repositories..."$NC

}

function installPrograms
{
   echo -e  $GREEN"Updating repositories..."$NC
   apt-get update
   
   echo -e  $GREEN"Installing programs..."$NC
   apt-get install aptitude
   aptitude install arandr i3 i3blocks i3lock clipit redshift feh vim lxappearance rofi pcmanfm compton xclip scrot terminator lm-sensors zenity
}

function copyMainDirectory
{
   echo -e $GREEN"Copying scripts and images..."$NC
   cp -r src/art3k /usr/share/
}

function reloadConfigs
{
   echo -e $GREEN"Reloading configs..."$NC
   cp src/configs/bashrc/.bashrc ~/
   cp -r src/configs/clipit/ ~/.config/
   cp -r src/configs/i3/ ~/.config/
   cp src/configs/i3blocks/i3blocks.conf /etc/
   cp -r src/configs/terminator ~/.config/  
   cp src/configs/vim/.vimrc ~/
   cp src/configs/i3blocks/volume /usr/share/i3blocks/
   cp src/configs/i3blocks/memory /usr/share/i3blocks/
   cp src/configs/i3blocks/time /usr/share/i3blocks/
   cp src/configs/profile/.profile ~/
   cp src/configs/fonts/.fonts/  ~/
   
}


checkPremissions
addRepositories
installPrograms
copyMainDirectory
reloadConfigs

echo -e $GREEN"\n\ni3 \"art3k\" config has been instaled!\n\n"$NC
