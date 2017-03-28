#!/bin/sh

# make sure we use UTF-8
export LANG=en_US.UTF-8

# use ctrl as the escape button
# xcape -e 'Control_L=Escape'
setxkbmap -option ctrl:nocaps

# faster key repeat rate
xset r rate 125 60

# faster mouse movement
# xset m 3/1 4
xinput set-prop 'Logitech USB Laser Mouse' 'libinput Accel Speed' 1.00000

# disable display turning off
xset s off -dpms

# merge Xresources file
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# enable the setting of brightness @ /sys/class/backlight/gmux_backlight/brightness
sudo setpci -v -H1 -s 00:01.00 BRIDGE_CONTROL=0
sudo chmod a+w /sys/class/backlight/gmux_backlight/brightness

# execute i3 wm
exec i3 -V >> ~/.cache/i3log-$(date +'%F-%k-%M-%S') 2>&1
