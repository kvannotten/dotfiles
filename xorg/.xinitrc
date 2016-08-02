#!/bin/sh

# make sure we use UTF-8
export LANG=en_US.UTF-8

# use ctrl as the escape button
# xcape -e 'Control_L=Escape'

# faster key repeat rate
xset r rate 130 60

# faster mouse movement
xset m 3/1 4

# disable display turning off
xset s off -dpms

# merge Xresources file
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# execute i3 wm
exec i3 -V >> ~/.cache/i3log-$(date +'%F-%k-%M-%S') 2>&1
