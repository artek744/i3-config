#!/bin/bash

GREEN="\e[32m"
CYAN="\033[0;96m"
NC="\e[39m"

scriptPath=$(cd "$(dirname "$0")" && pwd)

function installPrograms
{
	echo -e $CYAN"\nUpdating repositories..."$NC
	sudo apt-get update

	echo -e  $CYAN"\nInstalling programs..."$NC
	sudo apt-get  install aptitude arandr i3 i3blocks i3lock clipit redshift feh vim lxappearance rofi pcmanfm compton xclip scrot terminator lm-sensors zenity pactl amixer
}

function copyMainDirectory
{
   echo -e $CYAN"\nCopying scripts and images..."$NC
   sudo cp -r src/i3-personal /usr/share/
}

function deployConfigs
{
   echo -e $CYAN"\nDeploying configs..."$NC
   cp -R src/configs/homeDirectory/.  ~/
   $scriptPath/src/configs/i3blocks/deploy-i3blocks.sh
}

installPrograms
copyMainDirectory
deployConfigs

echo -e $GREEN"\n\ni3 \"art3k\" config has been instaled!\n\n"$NC
