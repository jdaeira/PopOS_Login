#!/bin/bash

DIR_LOGOS=$PWD"/Logos"
DIR_FILES=$PWD"/Files"

sudo cp $DIR_FILES"/gdm" /etc/dconf/profile
sudo mkdir /usr/share/pixmaps/logo
sudo cp $DIR_LOGOS"/New_POP_white.png" /usr/share/pixmaps/logo
sudo mkdir /etc/dconf/db/gdm.d
sudo cp $DIR_FILES"/01-logo" /etc/dconf/db/gdm.d

sudo dconf update

echo "############ Pop!_OS Logo Installed ##############"

