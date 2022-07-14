#!/bin/bash

CYAN="\e[0;96m"
NC="\e[39m"
configPath=$(cd "$(dirname "$0")" && pwd)

echo -e $CYAN"\nDeploying home configs..."$NC

### BASHRC FILE ###
echo "source $configPath/bashrc" >> ~/.bashrc

### CONFIG DIR  ###
rm -rf ~/.config/i3
sudo ln -fs $configPath/config/i3 ~/.config/

rm -rf ~/.config/copyq
sudo ln -fs $configPath/config/copyq ~/.config/

rm -rf ~/.config/terminator
sudo ln -fs $configPath/config/terminator ~/.config/

rm -rf ~/.config/rofi
sudo ln -fs $configPath/config/rofi ~/.config/

### FONTS DIR ###
rm -rf ~/.fonts
sudo ln -fs $configPath/fonts ~/.fonts
