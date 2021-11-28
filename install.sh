#! /bin/bash

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
