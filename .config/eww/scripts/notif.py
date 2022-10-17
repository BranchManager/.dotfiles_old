import subprocess as subp
import requests
import json
import sys
import os

#def get_icon(icon):

dunst_hist = subp.run(["dunstctl","history"], capture_output=True, text=True)
#subp.run(["eww","update","get_noti=(box :space-evenly \"true\" :vexpand \"false\" :orientation \"v\" (label :text \"hello in shell\" :valign \"center\" :class \"weather_label\" )(label :text \"hello in shell\" :valign \"center\" :class \"weather_label\" ))"])
#print("(notifcard)")
#print("(box :space-evenly \"true\" :vexpand \"false\" :orientation \"v\" (notifcard)(notifcard))")
#print(dunst_hist.stdout)
dunst_json = json.loads(dunst_hist.stdout)
#(label :text \"hello in shell\" :valign \"center\" :class \"weather_label\" )(label :text \"hello in shell\" :valign \"center\" :class \"weather_label\" )
#print(dunst_json["data"][0][1])
final_string = ""
button_script = "/home/branchmanager/.config/eww/scripts/toggle_fullQuote.sh reveal"
for i in range(len(dunst_json["data"][0][0:10])):
    #print(len(dunst_json["data"][0][0:3]))
    #if(dunst_json["data"][0][i] != 0):
    updated_button = button_script + str(i)
    message = dunst_json["data"][0][i]["message"]["data"]
    summary = dunst_json["data"][0][i]["summary"]["data"]
    appname = dunst_json["data"][0][i]["appname"]["data"]
    button_index = str(i)
    #print(message + summary + appname)

    icon_path = "/home/branchmanager/.config/eww/images/icons/"+appname+".svg"

    if(not(os.path.exists(icon_path))):
        icon_path = "/home/branchmanager/.config/eww/images/icons/notifbell.svg"

    print(icon_path)
    print(updated_button)

    #print(exists)
    #icon_class = appname+"_class"
    #else:
    #    print("nada")
    
'''for loop up until 4th notification
        check if it exists
            grab appname
            summary
            and message
            
            if appname has icon
                get icon path using appname
                maybe use a function here that returns the path along with the class name
                the different icons will need to be scales accordingly
            else 
                use a generic bell icon or something
        
        using appname summary message and iconpath create notifcard[] eww widget fuunction as string
        add this string to an appended string of notifcard widgets ex: "(nofifcard[:icon path :name appname :summ.....]) (notifcard[....])"
            
        //somewhere i need to check if the notification caome from a rondom app or one of the apps I have icosn for
        //maybe somewhere add button arg too so we know what reveal bool to change   
            '''