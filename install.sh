#!/bin/bash

GREEN="\e[32m"
NC="\e[39m"
scriptPath=$(cd "$(dirname "$0")" && pwd)

function updateRepositories
{
   echo -e $GREEN"Updating repositories..."$NC
   sudo apt-get update
}

function installPrograms
{
   echo -e  $GREEN"Installing programs..."$NC
   sudo apt-get install aptitude
   sudo aptitude install arandr i3 i3blocks i3lock clipit redshift feh vim lxappearance rofi pcmanfm compton xclip scrot terminator lm-sensors zenity pactl amixer
}

function copyMainDirectory
{
   echo -e $GREEN"Copying scripts and images..."$NC
   sudo cp -r src/i3-personal /usr/share/
}

function deployConfigs
{
   echo -e $GREEN"Deploying configs..."$NC
   cp -R src/configs/homeDirectory/.  ~/
   $scriptPath/src/configs/i3blocks/deploy-i3blocks.sh
}

updateRepositories
installPrograms
copyMainDirectory
deployConfigs

echo -e $GREEN"\n\ni3 \"art3k\" config has been instaled!\n\n"$NC
