wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"


sudo apt-get update
sudo apt-get install aptitude
sudo aptitude install arandr
sudo aptitude install i3
sudo aptitude install i3blocks
sudo aptitude install i3lock
sudo aptitude install clipit
sudo aptitude install redshift
sudo aptitude install feh
sudo aptitude install vim
sudo aptitude install qtcreator
sudo aptitude install google-chrome-stable
sudo aptitude install lxappearance
sudo aptitude install arc-theme
sudo aptitude install rofi
