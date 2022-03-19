#! /bin/bash

fedora () {
	# Install Script Dependencies
	sudo dnf install -y dialog
	dialog --msgbox  "Welcome to TruDE installer.\nPress OK to proceed." 10 50
	# Install DE Dependencies
	dialog   --mixedgauge   "Installing DE dependencies..." 10 50 0
	sudo dnf install -y nitrogen picom git &> /dev/null
	dialog   --mixedgauge   "Installing DE dependencies..." 10 50 30
	sudo dnf install -y libX11-devel libXft-devel libXinerama-devel libXrandr-devel xorg-x11-xinit-session &> /dev/null
	dialog   --mixedgauge   "Installing DE dependencies..." 10 50 70
	sudo dnf install -y fontawesome-fonts &> /dev/null
	dialog   --mixedgauge   "Installing DE dependencies..." 10 50 100
	sleep 0.5
	clear
}

install_nitrogen () {
    # Dependencies:
    # + nitrogen (APT)  (Wallpaper)
    # + nitrogen (REPO) (nitrogen config file)
    # + bg.png   (REPO) (Default wallpaper)

    sudo mkdir -p /usr/share/wallpapers/
    sudo cp bg.png /usr/share/wallpapers/
    cp -r nitrogen ~/.config/
}

compile () {
	dialog   --mixedgauge   "Compiling TruDE..." 10 50 0 
	cd dwm/ &> /dev/null
	mkdir -p ~/.dwm &> /dev/null
	cp -f autostart.sh ~/.dwm &> /dev/null
	sudo make clean install &> /dev/null
	cd ..
	
	dialog   --mixedgauge   "Compiling TruDE..." 10 50 25 
	cd dmenu/ &> /dev/null
	sudo make clean install &> /dev/null
	cd ..
	
	dialog   --mixedgauge   "Compiling TruDE..." 10 50 50 
	cd st/ &> /dev/null
	sudo make clean install &> /dev/null
	cd ..

	dialog   --mixedgauge   "Compiling TruDE..." 10 50 75 
	cd slstatus/ &> /dev/null
	sudo make clean install &> /dev/null
	cd ..
	dialog   --mixedgauge   "Compiling TruDE..." 10 50 100
	sleep 0.5
	clear
}

fedora
compile
install_nitrogen
rm -rf */*.o

# DE dependencies
# Arch Install
#sudo pacman -Sy picom nitrogen
# Compile dependencies
#sudo pacman -S base-devel git libx11 libxft xorg-server xorg-xinit xorg-xsetroot terminus-font 

# Debian Install
#sudo apt install -y compton nitrogen
