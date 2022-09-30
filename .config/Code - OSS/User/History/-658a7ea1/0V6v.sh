#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x
choosen_output () {
     
     canidate=$1
     shift
     #the shift command apparently removes 1st element form the array
     #I have to do this cause when I pass every thing in it becomes an array
     #therefore making my first argument, choosen, part of the array. so i store
     #it in a variable and remove it from the array
     arr=("$@")
     #echo "$canidate" > /home/branchmanager/test6.txt
     #echo  "${arr[0]}" > /home/branchmanager/test.txt
     #echo "${arr[@]}" > /home/branchmanager/array2.txt
     for i in "${!arr[@]}";
        do
        #echo "dodo"
        if [ "${arr[$i]}" == "$canidate" ]; then
            echo "$i"
            # >> /home/branchmanager/test3.txt
        fi
        #echo "hello" > /home/branchmanager/test3.txt
        #echo "$1">> /home/branchmanager/test2.txt
        #echo $i >> /home/branchmanager/test3.txt
        #diff <(echo "$1") <(echo "$i") >> /home/branchmanager/test4.txt
        #echo "{$arr[$i]}" >> /home/branchmanager/test4.txt
        done

}
#/media/ext_drive/home/branchmanager/This_is_another_home_dir_8-7-2022/branchmanager/.config/polybar/grayblocks/scripts/rofi
dir="/media/ext_drive/home/branchmanager/This_is_another_home_dir_8-7-2022/branchmanager/.config/polybar/grayblocks/scripts/rofi"
#dir="~/.config/polybar/grayblocks/scripts/rofi"


#current_output=$(pacmd list-sinks | grep -Pzo "\* index(.*\n)*" | sed \$d | grep -e "device.description" | cut -f2 -d\")
#current_output=$(pacmd list-sinks | grep -Pzo "\* index(.*\n)*" | sed \$d | grep -e "device.description" | cut -f2 -d\")
#current_output
#echo "$current_output"
#
#1    grep -Pzo "\* index(.*\n)*" outputs all lines after matching * index.
#1.5  sed -n '/index/,/index/p' is my hand written line where I assume grabs all the other output options I have access to on my system
#2    The last line on the output was causing problems. Removed it with sed \$d.
#3    grep -e "device.description" matches the first device.description.
#4    And lastly cut -f2 -d\" to output only the content.
current_output=$(pacmd list-sinks | sed -n '/\* index/,/index/p' | grep -e "device.description" |  cut -f2 -d\")
#1 pacmd list-sinks gets all the audio devices
#2  sed -n '/\* index/,/index/p' gets all the text beteween "* index" and "index"
#3 the I grep for the device.description
#4 then I cut off "device.description and i think it cuts off the quotes"
#current_output=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/volume_menu.rasi"


# Variable passed to rofi
#options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"
#options=$(pacmd list-sinks | grep "name:" | sed -e 's/^\s*//' -e '/^$/d'   )
options=$( pacmd list-sinks | grep "device.description" | cut -f2 -d\")
readarray -t lines < <(pacmd list-sinks | grep "device.description" | cut -f2 -d\")
#the readarray lines stores each output device description in an array called llines the 
#below line does the same except with linesss
#readarray -t linesss < <(echo -e "$options")

#output_names=$(pacmd list-sinks | grep "name:" | cut -f2 -d\ | tr -d '<>,')
#the above command will grab the output names, delimited by spaces since the nsmaes dont have spaces,
#also grabes the 3rd field (the f2) whihc is the nam es incased in '<>'
#then I use tr to get rid of the '<>'. This leaves the names used to set-default-sink
readarray -t actnames< <(pacmd list-sinks | grep "name:" | cut -f2 -d\ | tr -d '<>,')
choosen="$(echo -e "$options" | $rofi_command -p "Current Output: $current_output" -dmenu -selected-row 0)"
#echo -e "$options" | $rofi_command -dmenu -selected-row 0
my_selection=$(choosen_output "$choosen" "${lines[@]}")
#my_selection=$(choosen_output "$choosen" $lines)
#echo "${lines[@]}" > /home/branchmanager/array.txt
#echo "${actnames[$my_selection]}" >> /home/branchmanager/test5.txt
pacmd set-default-sink "${actnames[$my_selection]}"
