import subprocess as subp
import requests
import json
import sys

#dunst_hist = subp.run(["dunstctl","history"], capture_output=True, text=True)
#subp.run(["eww","update","get_noti=(box :space-evenly \"true\" :vexpand \"false\" :orientation \"v\" (label :text \"hello in shell\" :valign \"center\" :class \"weather_label\" )(label :text \"hello in shell\" :valign \"center\" :class \"weather_label\" ))"])
print("(notifcard)")
print("(box :space-evenly \"true\" :vexpand \"false\" :orientation \"v\" (label :text \"hello in shell\" :valign \"center\" :class \"weather_label\" )(label :text \"hello in shell\" :valign \"center\" :class \"weather_label\" ))")
#print(dunst_hist.stdout)
#dunst_json = json.loads(dunst_hist.stdout)

#print(dunst_json["data"][0][1])