#!/bin/sh

cd ~

#Installing paru AUR helper
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

cd ..

#Setting system theming configuration
sudo cp -r dotfiles/.config ~

#Setting screen layout
cp -r dotfiles/.screenlayout ~

#Installing and theming terminal
paru -S rxvt-unicode
cp dotfiles/.Xresources ~
cp -r dotfiles/.urxvt ~

#Installing needed fonts
paru -S noto-fonts siji-ttf noto-fonts-cjk ttf-font-awesome nerd-fonts-jetbrains-mono bdf-unifont

#Installing bash autocompletion
git clone --recursive https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local

#Setting bash configuration
cp dotfiles/.bashrc ~
cp dotfiles/.git-prompt.sh ~

#Installing programs I use
sudo pacman -S micro nitrogen firefox rofi lutris neofetch virt-manager thunar samba gvfs-smb pavucontrol python-pip scrot imagemagick dunst zenity alsa-utils arandr mpv gimp seahorse polybar gnome-disk-utility arandr yarn unrar picom
paru -S transmission-gtk file-roller ventoy-bin qemu-base ebtables steam vscodium timeshift 7-zip spotify-adblock


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#Setting papirus icons with catppuccin theme
paru -S catppuccin-gtk-theme-macchiato papirus-icon-theme-git oranchelo-icon-theme-git
# sudo cp -r ~/dotfiles/usr ~

git clone https://github.com/catppuccin/papirus-folders.git
cd papirus-folders
sudo cp -r src/* /usr/share/icons/Papirus
./papirus-folders -C cat-macchiato-lavender --theme Papirus-Dark
cd ..

cp -r dotfiles/Wallpapers ~

#Execute themeSpotify.sh after opening spotify and login in

#Installing discord
sudo pacman -S flatpak

#Enter manually after installing discord
#sudo flatpak override com.discordapp.Discord --filesystem=home

# Setting virt-manager permissions
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf
sudo usermod -a -G libvirt $USER
sudo sed -i 's/user = "libvirt-qemu"/user = "$USER"/' /etc/libvirt/qemu.conf
sudo sed -i 's/group = "libvirt-qemu"/group = "$USER"/' /etc/libvirt/qemu.conf

sudo rm -r ~/ble.sh
sudo rm -r ~/paru
sudo rm -r ~/papirus-folders
