#!/bin/bash

##--- removing unnecessary apps ---##

sudo apt remove xfburn -y
sudo apt remove xfce4-dict -y
sudo apt remove --purge libreoffice* -y
sudo apt-get purge transmission-gtk -y
sudo apt remove thunderbird -y
sudo apt remove pidgin -y

##--- installing repositories ---##

## install Flatpak ##
sudo add-apt-repository ppa:alexlarsson/flatpak -y 
sudo apt update-y
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y

## Install Snap ##
sudo apt install snapd -y

##--- installing apps---##

## Gimp image manipulation ##
flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref -y
flatpak update 

## Kdenlive video editor##
flatpak install flathub org.kde.kdenlive -y

## Darktable photo editor ##
sudo apt install darktable -y

##  brave web browser ##
sudo apt install apt-transport-https curl gnupg -y
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - 
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list 
sudo apt update
sudo apt install brave-browser -y

## blender ##
flatpak install flathub org.blender.Blender -y

## vs code #
flatpak install flathub com.visualstudio.code -y

##  audacity  audio editor ##
flatpak install flathub org.audacityteam.Audacity -y

##  obs-studio ##
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt update -y
sudo apt install obs-studio -y

## handbrake ##
sudo add-apt-repository ppa:stebbins/handbrake-releases -y
sudo apt update -y
sudo apt-get install handbrake-gtk -y
sudo apt-get install handbrake-cli -y

##vlc media player ##
flatpak install flathub org.videolan.VLC -y

## Qbit Torrent ##
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y 
sudo apt update -y
sudo apt install qbittorrent -y

## Free Download Manager ##
flatpak install flathub org.freedownloadmanager.Manager -y

## discord ##
flatpak install flathub com.discordapp.Discord -y

## Suite Only Office ##
flatpak install flathub org.onlyoffice.desktopeditors -y

## nvidia driver ##
sudo apt-add-repository ppa:graphics-drivers/ppa -y 
sudo apt update -y
sudo ubuntu-drivers autoinstall

#winff converter
sudo apt install winff -y

## microsoft fonts
sudo apt install ttf-mscorefonts-installer

## ez-exporter extension and inkscape vector editor ##
git clone https://github.com/adriel-filipe/ez-exporter
cd ez-exporter
sudo chmod +x install.sh
sudo ./install.sh

## finalizing settings ##
sudo apt update -y
sudo apt install -f
sudo apt autoremove -y
