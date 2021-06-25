#!/bin/bash

useradd -m -s $(which zsh) -G wheel,audio,video,optical,storage $1
passwd $1

curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/zshrc > /home/$1/.zshrc
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/xinitrc > /home/$1/.xinitrc
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/vimrc > /home/$1/.vimrc
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/tmux.conf > /home/$1/.tmux.conf
mkdir /home/$1/.config/alacritty
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/config/alacritty/alacritty.yml > /home/$1/.config/alacritty/alacritty.yml
mkdir /home/$1/.config/awesome
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/config/awesome/rc.lua > /home/$1/.config/awesome/rc.lua
mkdir /home$1/.config/mpd
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/config/mpd/mpd.conf > /home/$1/.config/mpd/mpd.conf

chown -R $1:$1 /home/$1
