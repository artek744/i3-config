#!/bin/bash

GREEN="\e[32m"
CYAN="\e[0;96m"
RED="\e[31m"
NC="\e[39m"

scriptPath=$(cd "$(dirname "$0")" && pwd)
basicPrograms="i3 i3blocks i3lock feh rofi pcmanfm compton lm-sensors xclip scrot zenity aptitude arandr clipit redshift-gtk lxappearance terminator"

function checkMethodStatus
{
	if [ $? -ne 0 ]; then
		echo -e $RED"\nInstalation has failed!\n"
		exit 1
	fi
}

function updateRepositories
{
   echo -e $CYAN"\nUpdating repositories..."$NC
   sudo apt-get update
}

function installPrograms
{
   echo -e $CYAN"\nInstalling programs..."$NC
   sudo apt-get install $@
	checkMethodStatus
}

function copyMainDirectory
{
   echo -e $CYAN"\nCopying scripts and images..."$NC
   sudo cp -r src/i3-personal /usr/share/
	checkMethodStatus
}

function deployConfigs
{
   echo -e $CYAN"\nDeploying configs..."$NC
   cp -R src/configs/homeDirectory/.  ~/
   $scriptPath/src/configs/i3blocks/deploy-i3blocks.sh
	checkMethodStatus
}

function main
{
   updateRepositories
   installPrograms $basicPrograms
   copyMainDirectory
   deployConfigs

   echo -e $GREEN"\n\ni3-config has been instaled!\n\n"$NC
}

main
