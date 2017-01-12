unclutter & 

mpd ~/.config/mpd/mpd.conf

# Here bspwm is kept as default
session=${1:-i3}

case $session in
    i3      ) exec i3;;
    bspwm   ) exec bspwm;;
esac
