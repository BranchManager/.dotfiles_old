#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession

#the following lien is so my pywal color schemes are set. Note this cannot do in bashrc or it will brick the config
wal -R -n
xsetroot -cursor_name left_ptr


