wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"

sudo apt-get update
sudo apt-get install aptitude
sudo aptitude install arandr i3 i3blocks i3lock clipit redshift feh vim lxappearance arc-theme rofi pcmanfm compton

sudo cp /etc/i3blocks.conf /etc/
sudo cp -r src/.config /home/ablaszczyk/
