#!/bin/bash

CYAN="\e[0;96m"
NC="\e[39m"
configPath=$(cd "$(dirname "$0")" && pwd)

echo -e $CYAN"\nDeploying i3blocks configs..."$NC

sudo ln -sf $configPath/i3blocks.conf /etc/
sudo ln -sf $configPath/memory /usr/share/i3blocks/
sudo ln -sf $configPath/time /usr/share/i3blocks/
sudo ln -sf $configPath/volume /usr/share/i3blocks/

