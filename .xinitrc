#!/bin/sh

# Start power manager in the background
xfce4-power-manager &

# Start compositor in the background
xcompmgr -cf -D 2 &

# Start file manager as daemon to support automounting, etc.
# FUCK. CERTIFIED NFG. DO NOT UNCOMMENT.
# thunar --daemon

# Start Dropbox in the background
dropbox &

# All set! Now start the window manager!
exec awesome
