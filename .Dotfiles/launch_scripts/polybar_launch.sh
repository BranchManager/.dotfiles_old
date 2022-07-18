#! /bin/sh


#LOCATION ON MY MACHINE: /home/branchmanager/launch_scripts/polybar_launch.sh
#terminate any already running instances of polybar
killall -q polybar

#wait until the processes have begun to shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#polybar config in /etc/polybar/config.ini
#you can specify a config with -c flag and the path to the config
#I have just been copying the config from ~/.config/polybar/grayblocks
#I am currently using the gray blocks theme
#launch polybar
#/home/branchmanager/.config/awesome/polybar-3.6.2/build/bin/polybar -c /home/branchmanager/.Dotfiles/polybar/grayblocks/config.ini main | tee 2>&1 /home/branchmanager/.Dotfiles/logs/polybar1.log &

/home/branchmanager/.config/awesome/polybar-3.6.2/build/bin/polybar -c /home/branchmanager/.config/polybar/pwidgets/main.ini primary | tee 2>&1 /home/branchmanager/.Dotfiles/logs/polybar1.log &


#/home/branchmanager/.config/awesome/polybar-3.6.2/build/bin/polybar -c /home/branchmanager/.Dotfiles/polybar/grayblocks/config.ini secondary | tee 2>&1 /home/branchmanager/.Dotfiles/logs/polybar2.log &

/home/branchmanager/.config/awesome/polybar-3.6.2/build/bin/polybar -c /home/branchmanager/.config/polybar/pwidgets/main.ini right | tee 2>&1 /home/branchmanager/.Dotfiles/logs/polybar2.log &


/home/branchmanager/.config/awesome/polybar-3.6.2/build/bin/polybar -c /home/branchmanager/.config/polybar/pwidgets/main.ini secondary | tee 2>&1 /home/branchmanager/.Dotfiles/logs/polybar3.log &
