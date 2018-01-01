#!/usr/bin/env bash

# rofi-power
# Use rofi to call systemctl for shutdown, reboot, etc

# 2016 Oliver Kraitschy - http://okraits.de

OPTIONS="lock\nsuspend\nlogout\nreboot\npoweroff"

LAUNCHER="rofi -lines 5 -location 1 -xoffset 50 -yoffset 100 -width 10 -dmenu -i -p power:"

option=`echo -e $OPTIONS | $LAUNCHER`
if [ ${#option} -gt 0 ]
then
    case $option in
      reboot)
        systemctl reboot
        ;;
      poweroff)
        systemctl poweroff
        ;;
      lock)
        i3lock -k --datestr="%a %m/%d/%y" -i ~/Pictures/night_sky_blur.png --insidevercolor=1e2832ff --insidewrongcolor=d73737ff --insidecolor=1e2832ff --ringvercolor=1e2832ff --ringwrongcolor=1e2832ff --ringcolor=1e2832ff --linecolor=1e2832ff --separatorcolor=1e2832ff --textcolor=afffa3ff --keyhlcolor=60ac39ff --bshlcolor=d73737ff
        ;;
      logout)
        i3-msg exit
        ;;
      suspend)
        i3lock -k --datestr="%a %m/%d/%y" -i ~/Pictures/night_sky_blur.png --insidevercolor=1e2832ff --insidewrongcolor=d73737ff --insidecolor=1e2832ff --ringvercolor=1e2832ff --ringwrongcolor=1e2832ff --ringcolor=1e2832ff --linecolor=1e2832ff --separatorcolor=1e2832ff --textcolor=dd3cffff --keyhlcolor=60ac39ff --bshlcolor=d73737ff;
        systemctl suspend
        ;;
    esac
fi
