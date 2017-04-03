#!/bin/sh

# Grab X settings from .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Start power manager in the background
xfce4-power-manager &

# Start compositor in the background
xcompmgr -cf -D 2 &

# Start file manager as daemon to support automounting, etc.
# FUCK. CERTIFIED NFG. DO NOT UNCOMMENT.
# thunar --daemon

# How about this for automounting?
udiskie &

# Start Dropbox in the background
dropbox &

# All set! Now start the window manager!
# (Removing 'exec' lets you stay logged in after exiting awesome)
exec awesome
