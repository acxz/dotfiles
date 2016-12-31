unclutter & 
# Here bspwm is kept as default
session=${1:-i3}

case $session in
    i3      ) exec i3;;
    bspwm   ) exec bspwm;;
esac

sudo netctl start wlp8s0-TownsmanMotel_61_24G
