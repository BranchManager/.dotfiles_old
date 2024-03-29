from geopy.geocoders import Nominatim
import geocoder
import requests
import json
import sys
import subprocess as subp


class weather_class:
    icon_dict =  {'11d':'', '09d':'', '10d':'', '13d':'', '50d':'', '01d':'', '01n':'', '02d':'', '02n':'','03d':'摒','03n':'摒','04d':'','04n':''}

    #11d thunderstorm,  09d: drizzle uses rain image, 10d:rain ,13d: snow 50d: unclear weather/atmosphere conditions 01d: sunshine 01n: moon 03* scattered clouds 04*;overcast
    def __init__(self):
        self.desc = None
        self.image=None
        self.temp_=None
        self.feels_like=None
        self.feels_liek=None
        self.min_tmp=None
        self.max_tmp=None
        self.sunrise=None
        self.sunset=None
        self.icon=None
    def kel_to_far(self,temp):
        num = (temp-273.15)*9
        return str(round((num/5)+32))+"°"

    def create_img(self):
        code = self.icon[:-1]
        if code == "09":
            code = '10'
        path = '/home/branchmanager/.config/eww/images/weather_icon/'+code+'.jpg'
        #print(path)
        #pathtest = '/home/branchmanager/.config/eww/images/weather_icon/10.jpg'
        return path

    def set_temp(self):
        subp.run(["eww","update","weather_icon="+str(self.icon_dict[self.icon])])
        image_path=self.create_img()
        subp.run(["eww","update","weatherimage="+image_path])
        print(self.temp)
        subp.run(["eww","update","temp="+self.temp])

        print(self.icon_dict[self.icon])

    def set_important(self,data):
        self.desc = data['weather'][0]['description']
        self.icon = data['weather'][0]['icon'] #backgorund image
        self.temp = self.kel_to_far(data['main']['temp'])
        self.feels_like = data['main']['feels_like']
        self.min_tmp = self.kel_to_far(data['main']['temp_min'])
        self.max_tmp = self.kel_to_far(data['main']['temp_max'])
        self.sunrise = data['sys']['sunrise']
        self.sunset = data['sys']['sunset']


    def getwheather_json(self,key,long,lat):
        print(key)
        url="https://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+long+"&appid="+key
        print(url)
        response = requests.get(url)
        weather_json = response.json()
        #print(weather_json.text)
        
        json.dump(weather_json, sys.stdout, indent=4)
        return weather_json
    def get_location(self):
        Nomi_locator = Nominatim(user_agent="My App")

        my_location= geocoder.ip('me')

        #my latitude and longitude coordinates
        latitude= my_location.geojson['features'][0]['properties']['lat']
        longitude = my_location.geojson['features'][0]['properties']['lng']

        place = Nomi_locator.reverse(f"{latitude}, {longitude}")
        return [longitude,latitude, place]
if __name__ == "__main__":

    weather = weather_class()
    long,lat,place = weather.get_location()
    weather_json = weather.getwheather_json("9bc07b0b7bd82f5562869cd04e598393",str(long),str(lat))
    weather.set_important(weather_json)
    weather.set_temp()

  
    '''print(weather_json['weather'][0]['description'])
    print(weather_json['weather'][0]['icon']) #backgorund image
    print(weather_json['main']['temp'])
    print(weather_json['main']['feels_like'])
    print(weather_json['main']['temp_min'])
    print(weather_json['main']['temp_max'])
    print(weather_json['sys']['sunrise'])
    print(weather_json['sys']['sunset'])
    #print(weather_json['icon'])
    #print(weather_json[''])
    subp.run(["eww","update","temp_in_kel="+str(weather_json['main']['temp'])])
    print(long)
    print(lat)
    print(place)'''