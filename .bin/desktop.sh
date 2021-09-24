#!/bin/sh

. ~/.bin/dependencies.sh

sudo pacman -Syyu kitty vivaldi discord steam docker pavucontrol --noconfirm

yay -S realvnc-vnc-viewer openconnect --noconfirm
