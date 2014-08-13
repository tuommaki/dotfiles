#!/bin/sh

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

xsetroot -solid '#252627' &
xmodmap /home/tmak/.Xmodmap &
xrdb -merge /home/tmak/.Xresources &
xscreensaver -nosplash &
i3
