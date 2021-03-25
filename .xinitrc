#~/bin/sh

# Get color scheme from .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Start power manager
#xfce4-power-manager
powerkit &

# Start compositor
xcompmgr -cf -D 2 &

# Start redshift
# configured in .config/redshift
redshift &

# Pulseaudio needs to be poked in order to start correctly.
# So I found this 2 second silent audio file. Playing it causes pulse to start.
paplay /home/james/Silent/Silent.wav &

dropbox &

# Have an awesome time
exec awesome
