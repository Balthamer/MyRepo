#!/bin/bash

echo "What is the new user name?"
read user

useradd -m -s $(which zsh) -G wheel,audio,video,optical,storage $user

curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/zshrc > /home/$user/.zshrc
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/xinitrc > /home/$user/.xinitrc
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/vimrc > /home/$user/.vimrc
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/tmux.conf > /home/$user/.tmux.conf
mkdir -p /home/$user/.config/{alacritty,mpd,ranger,picom,bspwm,sxhkd,polybar}
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/config/alacritty/alacritty.yml > /home/$user/.config/alacritty/alacritty.yml
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/config/mpd/mpd.conf > /home/$user/.config/mpd/mpd.conf
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/config/ranger/rc.conf > /home/$user/.config/ranger/rc.conf
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/config/bspwm/bspwmrc > /home/$user/.config/bspwm/bspwmrc
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/config/polybar/config > /home/$user/.config/polybar/config
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/config/polybar/launch.sh > /home/$user/.config/polybar/launch.sh
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/config/sxhkd/sxhkdrc > /home/$user/.config/sxhkd/sxhkdrc
curl https://raw.githubusercontent.com/Balthamer/MyRepo/main/Arch/Dots/config/picom/picom.conf > /home/$user/.config/picom/picom.conf

chown -R $user:$user /home/$user

passwd $user
