#! /bin/sh


#LOCATION ON MY MACHINE: /home/branchmanager/launch_scripts/picom_launch.sh
killall -q picom

while pgrep -u $UID -x picom >/dev/null; do sleep 1; done

/home/branchmanager/.config/awesome/picom/build/src/picom --experimental-backends -b | tee 2>&1 /home/branchmanager/.Dotfiles/logs/picom.log
