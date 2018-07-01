#!/bin/bash

# For Ubuntu *****

sudo apt-get update && sudo apt-get upgrade
sudo apt-get install build-essential conky git gnuplot libncurses5-dev peek tmux valgrind

# For Arch *****

# Update & Install necessary packages
#sudo pacman -Syu
#sudo pacman -S --noconfirm --needed base-devel boost calcurse conky clang cmake deluge \
#emacs ffmpeg firefox freeglut gdb git geany glew gnuplot mesa ncdu opencl-headers \
#opencl-mesa screenfetch thunderbird tmux valgrind vim virtualbox wget

# Get yaourt
#sudo echo -e "\n[archlinuxfr]\nSiglevel = Never\nServer = http://repo.archlinux.fr/x86_64" \
#>> /etc/pacman.conf

#sudo pacman -S yaourt

#yaourt -Syu
#yaourt -S --noconfirm peek radeontop telegram-desktop-bin

# Display installed packages
#sudo pacman -Qe
