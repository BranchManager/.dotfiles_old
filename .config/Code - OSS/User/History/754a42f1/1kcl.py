import subprocess as subp
import requests
import json
import sys

json.loads(str(subp.run(["dunstctl","history"])))
#print('(notifcard)')