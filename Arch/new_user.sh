#!/bin/bash

echo "What is the new user name?"
read user

useradd -m -s $(which zsh) -G wheel,audio,video,optical,storage $user

curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/zshrc > /home/$user/.zshrc
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/xinitrc > /home/$user/.xinitrc
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/vimrc > /home/$user/.vimrc
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/tmux.conf > /home/$user/.tmux.conf
mkdir -p /home/$user/.config/alacritty
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/config/alacritty/alacritty.yml > /home/$user/.config/alacritty/alacritty.yml
mkdir /home/$user/.config/awesome
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/config/awesome/rc.lua > /home/$user/.config/awesome/rc.lua
mkdir /home/$user/.config/mpd
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/config/mpd/mpd.conf > /home/$user/.config/mpd/mpd.conf
mkdir /home/$user/.config/ranger
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/config/ranger/rc.conf > /home/$user/.config/ranger/rc.conf

chown -R $user:$user /home/$user

passwd $user
