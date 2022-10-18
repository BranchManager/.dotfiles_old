isopen=$( eww windows | grep mainbg | grep *mainbg )
echo $isopen

if [ -z "$isopen" ]
then
    eww open-many mainbg profile weather notif_area
    python3 ./scripts/weather.py
else
    eww close-all
fi