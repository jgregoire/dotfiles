# Start X Server, only on VT1 and only if a physical display is detected.
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
