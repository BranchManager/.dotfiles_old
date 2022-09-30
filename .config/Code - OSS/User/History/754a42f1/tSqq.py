import subprocess as subp
import requests
import json
import sys

#dunst_hist = subp.run(["dunstctl","history"], capture_output=True, text=True)
print("(notifcard)")
print("(box :space-evenly \"true\" :vexpand \"false\" :orientation \"v\" (notifcard)(notifcard))")
#print(dunst_hist.stdout)
#dunst_json = json.loads(dunst_hist.stdout)

#print(dunst_json["data"][0][1])