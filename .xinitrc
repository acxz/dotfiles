unclutter & 
# Here bspwm is kept as default
session=${1:-bspwm}

case $session in
    i3      ) exec i3;;
    bspwm   ) exec bspwm;;
esac
