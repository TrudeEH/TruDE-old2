#! /bin/bash

fedora() {
	# Install Script Dependencies
	sudo dnf install -y dialog
	dialog --msgbox  "Welcome to TruDE installer.\nPress OK to proceed." 10 50
	# Install DE Dependencies
	dialog   --mixedgauge   "Installing DE dependencies..." 10 50 0
	sudo dnf install -y nitrogen git &> /dev/null
	dialog   --mixedgauge   "Installing DE dependencies..." 10 50 30
	sudo dnf install -y libX11-devel libXft-devel libXinerama-devel libXrandr-devel xorg-x11-xinit-session &> /dev/null
	dialog   --mixedgauge   "Installing DE dependencies..." 10 50 55
	sudo dnf install -y fontawesome-fonts &> /dev/null
	dialog   --mixedgauge   "Installing DE dependencies..." 10 50 70
	sudo dnf install -y ninja-build dbus-devel gcc git libconfig-devel libdrm-devel libev-devel libX11-devel libX11-xcb libXext-devel libxcb-devel mesa-libGL-devel meson pcre-devel pixman-devel uthash-devel xcb-util-image-devel xcb-util-renderutil-devel xorg-x11-proto-devel &> /dev/null
	dialog   --mixedgauge   "Installing DE dependencies..." 10 50 100
	sleep 0.5
	clear
}

picom_install() {
	# Picom fork with animations and effects
	git clone https://github.com/jonaburg/picom
	cd picom
	meson --buildtype=release . build
	ninja -C build
	# To install the binaries in /usr/local/bin (optional)
	sudo ninja -C build install
	cd ..
	sudo rm -rf picom

	mkdir -p ~/.config/picom/
	cp -f picom.conf ~/.config/picom/
	sleep 5
}

fedora_config() {
	# Enable rpm fusion
	dialog   --mixedgauge   "Installing rpm fusion..." 10 50 0
	sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm &> /dev/null

	# Install Preload
	dialog   --mixedgauge   "Installing preload..." 10 50 65
	sudo dnf copr enable elxreno/preload -y &> /dev/null && sudo dnf install preload -y &> /dev/null

	# Enable flathub
	dialog   --mixedgauge   "Installing flathub..." 10 50 100
	sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &> /dev/null
        sleep 0.5
        clear
}

install_nitrogen() {
    # Dependencies:
    # + nitrogen (PKG)  (Wallpaper)
    # + nitrogen (REPO) (nitrogen config file)
    # + bg.png   (REPO) (Default wallpaper)

    sudo mkdir -p /usr/share/wallpapers/
    sudo cp bg.png /usr/share/wallpapers/
    cp -r nitrogen ~/.config/
}

compile() {
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
fedora_config
compile
install_nitrogen
picom_install
rm -rf */*.o

dialog --msgbox  "Done." 10 50
clear

# DE dependencies
# Arch Install
#sudo pacman -Sy picom nitrogen
# Compile dependencies
#sudo pacman -S base-devel git libx11 libxft xorg-server xorg-xinit xorg-xsetroot terminus-font 

# Debian Install
#sudo apt install -y compton nitrogen
