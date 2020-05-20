#!/bin/bash

DIR_LOGOS=$PWD"/Logos"
DIR_FILES=$PWD"/Files"

## Create the GDM profile
sudo cp $DIR_FILES"/gdm" /etc/dconf/profile

## Copy the Logos into the appropiate directory
sudo mkdir /usr/share/pixmaps/logo 2> /dev/null
sudo cp $DIR_LOGOS"/New_POP_yellow.png" /usr/share/pixmaps/logo
sudo cp $DIR_LOGOS"/New_POP_white.png" /usr/share/pixmaps/logo

## Create a GDM Database for Machine Wide Settings
sudo mkdir /etc/dconf/db/gdm.d 2> /dev/null
sudo cp $DIR_FILES"/01-logo" /etc/dconf/db/gdm.d

## This will get the color picked from the command line
COLOR="${1}"

## Will change the logo based on the color picked. Will exit if the wrong color is picked.
if [[ "${COLOR}" == "yellow" ]]
then
  echo 'You picked the Yellow Logo'
  cat $DIR_FILES"/yellow_logo" > /etc/dconf/db/gdm.d/01-logo
elif [[ "${COLOR}" == "white" ]]
then  
  echo 'You picked the White Logo'
  cat $DIR_FILES"/white_logo" > /etc/dconf/db/gdm.d/01-logo
else
  echo "You didn't pick a valid color"
  exit 1
fi


## Update the System Databases
sudo dconf update

echo "############ Pop!_OS Logo Installed ##############"

