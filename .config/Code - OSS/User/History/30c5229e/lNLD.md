---
layout: single
title:  Getting Waybar ready for Hyrland
date:   
author: Noah

categories: 
  - Ricing
  - 
tags: 
 - Rice

categories_label: "Categories: "

toc: true
---

being on arch I first had to install the waybar-hyprland-git package using hte aur. you could also add a flag to the code and compile

I needed a dont so yay -S nerd-fonts. It downloads a variety of nerd fonts.
Now the icons that looked like hyroglyphs are shown. I can also ass icons to my bar. I
started off with the menu. and to give the active workspace some flare I jused some help from his workspace https://github.com/frigaut/hyprland-dotfilessince I don't really use css.

~~~ json
 "custom/menu": {
        "format": "",
        "on-click": "rofi -show run"
    },
~~~

I wanted rounded borders around my workspaces so I added a few lines to the workspaces tab in the style.css
~~~css
#workspaces {
    /*margin: 0 4px;*/
    margin: 4px 0;
    background-color: #b7bdf8;
    border-radius: 5px;
    padding: 0px 10px ;
    min-width: 100px
   
}

~~~