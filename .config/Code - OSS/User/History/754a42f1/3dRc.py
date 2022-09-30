import subprocess as subp
import requests
import json
import sys

dunst_hist = subp.check_output(["dunstctl","history"])
print("hello")
print(dunst_hist)