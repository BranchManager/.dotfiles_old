import subprocess as subp
import requests
import json
import sys

dunst_hist = subp.run(["dunstctl","history"], capture_output=True, text=True)
print("hello")
#print(dunst_hist.stdout)
dunst_json = json.loads(dunst_hist.stdout)

print(dunst_json["data"][0][1])