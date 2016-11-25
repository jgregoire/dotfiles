#!/bin/sh

# Start power manager in the background
xfce4-power-manager &

# Start compositor in the background
xcompmgr -cf -D 2 &

# All set! Now start the window manager!
exec awesome
