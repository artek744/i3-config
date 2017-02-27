#!/bin/bash
GREEN="\e[32m"
NC="\e[39m"

configPath=$(cd "$(dirname "$0")" && pwd)
echo -e $GREEN"Deploying i3blocks configs..."$NC
sudo cp $configPath/i3blocks.conf /etc/
sudo cp $configPath/memory /usr/share/i3blocks/
sudo cp $configPath/time /usr/share/i3blocks/
sudo cp $configPath/volume /usr/share/i3blocks/

