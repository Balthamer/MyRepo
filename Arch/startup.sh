#!/bin/bash

echo '[multilib]' >> /etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf

pacman -Sy zsh zsh-autosuggestions zsh-completions tmux gdb ghex bc htop wget usbutils git tree pacman-contrib lsof dmidecode dialog notepadqq zip unzip unrar p7zip traceroute bind-tools whois nmap gnu-netcat openssh openvpn cronie xdg-user-dirs haveged alsa-utils alsa-plugins pulseaudio pulseaudio-alsa gsfonts ttf-bitstream-vera ttf-dejavu ttf-liberation ttf-hanazono ttf-baekmuk screengrab sxiv zathura texlive-most biber alacritty figlet ranger python-pywal mpd ncmpcpp cherrytree awesome xorg-xinit rofi --noconfirm
