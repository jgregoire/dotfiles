#~/bin/sh

# Get color scheme from .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Tell mpc where our server is.
# assumes /etc/hosts is configured.
export MPD_HOST=heaviside

# Start power manager
powerkit &

# Start compositor
xcompmgr -cf -D 2 &

# Start redshift
# configured in .config/redshift
# This is started by the redshift lain widget now.
#redshift &

# Pulseaudio needs to be poked in order to start correctly.
# So I found this 2 second silent audio file. Playing it causes pulse to start.
paplay /home/james/Silent/Silent.wav &

# Start dropbox
dropbox &

# Have an awesome time
exec awesome
