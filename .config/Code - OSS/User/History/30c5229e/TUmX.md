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



#####################################################
waybar issue
diown command
https://github.com/Alexays/Waybar/issues/991












##############################new post bewlow######################

Setting theme on arch . If you are using gnome tools or really any tools that use GTK you may wan tthem to fit the theme of some of your other things. Many resources will say lxappearance but infortuantely that didn't work for me. It was a great way to preview a theme however it didn't set anything for me. I'm not sure if it is because I'm on wayalnd or what. however dconf-editor seemed to work wonders. 
After using lxappearance to preview a theme I could install and run dconf-editor then fo to /org/gnome/dektoop/interface/icon-theme and where it says "gtk-theme" I could manually specify what I wanted based on what I previewed in lxappearance. 