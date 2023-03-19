export AWESOME_FONT="Fira Code Regular 12"
export TERM_FONT="Fira Code Regular 12"
export GVIM_FONT="Fira\ Code:h12"

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
