unclutter & 

mpd ~/.config/mpd/mpd.conf
pulseaudio --start
# Make colorscheme persist on reboot
wal -i "$(< "${HOME}/.cache/wal/wal")"
# xrdb -I$HOME ~/.Xrofi

# Here i3 is kept as default
session=${1:-i3}

case $session in
    i3      ) exec i3;;
    bspwm   ) exec bspwm;;
esac
