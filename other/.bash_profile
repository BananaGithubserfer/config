#export XDG_CURRENT_DESKTOP=sway

[ "$(tty)" = "/dev/tty1" ] && dbus-run-session sway
