#! /bin/bash

# Older screensaver image
# If you don't want to save a "default" screensaver coment this and the last
# two lines
OLDER_IMAGE=file:///home/marcio/Pictures/star_wars_12-wallpaper-1920x1080.jpg

# If you want to mantain this image till the next startup, change the location
IMAGE=/tmp/lock.png

# Change the type of the blour if you want more blurred images
# STRONGER 0x4 0x6 0x8 1x4 1x6 1x8 WEAKER
# The delay time will be inceased if you pick a stronger blur
BLUR="0x8"

# The magick happen heare 
scrot $IMAGE
convert $IMAGE -blur $BLUR $IMAGE
convert -resize 1920x1080  $IMAGE $IMAGE

# Set the new picture
# For gnome
gsettings set org.gnome.desktop.screensaver picture-uri file://$IMAGE
# Call Screen lock
dbus-send --type=method_call --dest=org.gnome.ScreenSaver  /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock

# Set the original screensaver picture
sleep 5m 
gsettings set org.gnome.desktop.screensaver picture-uri $OLDER_IMAGE
