---
layout: post
title: "ArchLinux Configuration"
data: 
  created: 2024-09-24 12:00
author: wgz
tag: archlinux
---

# ArchLinux Configuration

Recommand follow the [General recommendations](https://wiki.archlinux.org/title/General_recommendations#Graphical_user_interface), and this artical is just some supplements.



## 图形用户接口 Graphical user interface
### 显示服务器 Display server
- Xorg
- Wayland

### 显示驱动器 Display drivers
- Nvidia

### 桌面环境 Desktop environments
- 

### 窗口管理器 Window managers or compositors
- dwm

## 字体设置中文 Font configuration/Chinese
速速把所有能整上的免费字体都给整上
```
$ sudo pacman -S noto-fonts-cjk wqy-microhei wqy-microhei-lite wqy-bitmapfont
$ sudo pacman -S wqy-zenhei ttf-arphic-ukai ttf-arphic-uming adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
$ sudo pacman -S ttf-roboto noto-fonts ttf-dejavu.
```

## 声音系统 Sound system
### Advanced Linux Sound Architecture
```
$ sudo pacman -S alsa-utils

# reboot
$ alsamixer
```

For laptop, maybe you have two sound cards so 
it is important to choose the right card.
### An example of setting default device using "defaults" node
You'd better to search **/default** and change the origin content rather directly add below content
```
/usr/share/alsa/alsa.conf
-------------------------------------------
defaults.ctl.card 1; # Sets default device and control to second card (counting begins with 0).
defaults.pcm.card 1; # This does not change the data type.
```
### JACK Audio Connection Kit
```
$ sudo pacman -S jack2

# Starting the audio graph 
$ jackd
```


