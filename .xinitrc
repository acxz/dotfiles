unclutter &

mpd ~/.config/mpd/mpd.conf
pulseaudio --start

xrandr --dpi 144
xrdb -merge ~/.Xresources

# Add this to your .xinitrc or whatever file starts programs on startup.
# -R restores the last colorscheme that was in use.
wal -R

# Here i3 is kept as default
session=${1:-i3}

case $session in
    i3      ) exec i3;;
    bspwm   ) exec bspwm;;
    hlwm    ) exec herbstluftwm;;
esac
