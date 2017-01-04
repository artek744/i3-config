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
   wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
   sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"
}

function installPrograms
{
   echo -e  $GREEN"Updating repositories..."$NC
   apt-get update
   
   echo -e  $GREEN"Installing programs..."$NC
   apt-get install aptitude
   aptitude install arandr i3 i3blocks i3lock clipit redshift feh vim lxappearance arc-theme rofi pcmanfm compton xclip scrot
}

function reloadConfigs
{
   echo -e $GREEN"Reloading configs..."$NC
   cp src/configs/i3blocks.conf /etc/
   cp -r src/configs/i3/ ~/.config/
   cp -r src/configs/clipit/ ~/.config/
   cp src/configs/vim/.vimrc ~/
}

checkPremissions
addRepositories
installPrograms
reloadConfigs

echo -e $GREEN"i3 art3k config has been instaled!"$NC
