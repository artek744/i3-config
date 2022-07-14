#!/bin/bash

GREEN="\e[32m"
CYAN="\e[0;96m"
RED="\e[31m"
NC="\e[39m"

scriptPath=$(cd "$(dirname "$0")" && pwd)
basicPrograms="i3 i3blocks i3lock feh rofi pcmanfm compton lm-sensors xclip scrot zenity arandr copyq redshift-gtk lxappearance terminator doublecmd-gtk"

function checkMethodStatus
{
    if [ $? -ne 0 ]; then
        echo -e $RED"\nInstalation has failed!\n"
        exit 1
    fi
}

function installPrograms
{
    echo -e $CYAN"\nUpdating repositories..."$NC
    sudo apt-get update

    echo -e $CYAN"\nInstalling programs..."$NC
    sudo apt-get install $@
    checkMethodStatus
}

function deployFilesAndDirs
{
    echo -e $CYAN"\nDeploying files and dirs..."$NC
    sudo ln -fs $scriptPath/src/i3-personal /usr/share/

    $scriptPath/src/configs/home_config/deploy_home_config.sh
    checkMethodStatus

    $scriptPath/src/configs/i3blocks_config/deploy_i3blocks.sh
    checkMethodStatus
}

function main
{
    installPrograms $basicPrograms
    deployFilesAndDirs

    echo -e $GREEN"\ni3-config has been instaled!\n"$NC
}

main
