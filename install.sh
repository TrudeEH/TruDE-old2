#! /bin/bash

# DE dependencies
sudo apt install -y compton nitrogen
sudo pacman -Sy picom nitrogen

# COmpile dependencies
sudo pacman -S base-devel git libx11 libxft xorg-server xorg-xinit xorg-xsetroot terminus-font 

install_nitrogen () {
    # Dependencies:
    # + nitrogen (APT)  (Wallpaper)
    # + nitrogen (REPO) (nitrogen config file)
    # + bg.png   (REPO) (Default wallpaper)

    sudo mkdir -p /usr/share/wallpapers/
    sudo cp bg.png /usr/share/wallpapers/
    cp -r nitrogen ~/.config/
}


cd dwm/
mkdir -p ~/.dwm
cp -f autostart.sh ~/.dwm
sudo make clean install
cd ..

cd dmenu/
sudo make clean install
cd ..

cd st/
sudo make clean install
cd ..

install_nitrogen

rm -rf */*.o
