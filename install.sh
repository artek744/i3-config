#!/bin/bash

GREEN="\e[32m"
CYAN="\e[0;96m"
RED="\e[31m"
NC="\e[39m"

scriptPath=$(cd "$(dirname "$0")" && pwd)
basicPrograms="i3 i3blocks i3lock feh rofi pcmanfm compton lm-sensors xclip scrot zenity"
additionalPrograms="aptitude arandr clipit redshift-gtk vim vim-gnome lxappearance pcmanfm terminator"

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

function installAdditionalPrograms
{
	while true
	do
		echo ""
		read -r -p "Do you want to install additional programs? [y/n] " choice
		case "$choice" in
			n|N)	break;;
			y|Y)
               installPrograms $additionalPrograms
					break;;
			*) echo 'Response not valid';;
		esac
	done
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
   installAdditionalPrograms
   copyMainDirectory
   deployConfigs

   echo -e $GREEN"\n\ni3 \"art3k\" config has been instaled!\n\n"$NC
}

main
