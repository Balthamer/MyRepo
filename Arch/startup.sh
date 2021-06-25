#!/bin/bash


echo '[multilib]' >> /etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf

pacman -Sy vi vim networkmanager man-db man-pages grub zsh zsh-autosuggestions zsh-completions tmux gdb ghex bc htop wget usbutils git tree pacman-contrib lsof dmidecode dialog notepadqq zip unzip unrar p7zip traceroute bind-tools whois nmap gnu-netcat openssh openvpn cronie xdg-user-dirs haveged alsa-utils alsa-plugins pulseaudio pulseaudio-alsa gsfonts ttf-bitstream-vera ttf-dejavu ttf-liberation ttf-hanazono ttf-baekmuk screengrab sxiv zathura texlive-most biber alacritty figlet ranger python-pywal mpd ncmpcpp cherrytree awesome xorg-xinit rofi --noconfirm &&

grub-install --efi-directory=/boot --target=x86_64-efi &&
sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/g' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg &&

systemctl enable NetworkManager
chsh -s $(which zsh)
systemctl enable sshd
systemctl enable cronie
systemctl enable haveged

sed -i '/DESKTOP/d' /etc/xdg/user-dirs.defaults
sed -i '/TEMPLATES/d' /etc/xdg/user-dirs.defaults
sed -i '/PUBLIC/d' /etc/xdg/user-dirs.defaults


ln -sf /usr/share/zoneinfo/America/Indianapolis /etc/localtime
hwclock --systohc
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
clear
echo 'Name your system'
read system
echo $system > /etc/host
echo '127.0.0.1         localhost' >> /etc/hosts
echo '::1               localhost' >> /etc/hosts
echo '127.0.1.1         $system.localdomain $system'

echo 'Enter a user name'
read USER
useradd -m -s $(which zsh) -G wheel,audio,video,optical,storage $USER
passwd $USER

cp /home/$USER/Git/MyRepo/Arch/Dots/zshrc /home/$USER/.zshrc
cp /home/$USER/Git/MyRepo/Arch/Dots/vimrc /home/$USER/.vimrc
cp /home/$USER/Git/MyRepo/Arch/Dots/tmux.conf /home/$USER/.tmux.conf
cp /home/$USER/Git/MyRepo/Arch/Dots/xinitrc /home/$USER/.xinitrc
cp -r /home/$USER/Git/MyRepo/Arch/Dots/config/alacritty /home/$USER/.config/alacritty/
cp -r /home/$USER/Git/MyRepo/Arch/Dots/config/awesome /home/$USER/.config/awesome/
cp -r /home/$USER/Git/MyRepo/Arch/Dots/config/mpd /home/$USER.config/mpd

visudo


