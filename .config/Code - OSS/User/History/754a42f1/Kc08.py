import subprocess as subp
import requests
import json
import sys

dunst_hist = subp.run(["dunstctl","history"])
print("hello")
print(dunst_hist)