unclutter &

mpd ~/.config/mpd/mpd.conf
pulseaudio --start

xrandr --dpi 144
xrdb -merge ~/.Xresources

# Make colorscheme persist on reboot
#wal -i "$(< "${HOME}/.cache/wal/wal")"
wal -R

# Here i3 is kept as default
session=${1:-i3}

case $session in
    i3      ) exec i3;;
    bspwm   ) exec bspwm;;
    hlwm    ) exec herbstluftwm;;
esac

