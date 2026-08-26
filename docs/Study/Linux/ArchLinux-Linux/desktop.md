---
title: ArchLinux-Desktop
author: wgz
data: 2024-09-23
tag: archlinux
---

# ArchLinux-Desktop


## Display Driver
> [Nvidia Driver Installation](https://wiki.archlinux.org/title/NVIDIA)


```shell
Find the family of your card:
$ lspci -k | grep -A 2 -E "(VGA|3D)"

As for laptop:
$ sudo pacman -S xf86-video-nouveau
$ sudo pacman -S nvidia-open

or as for computer with only one card: 
$ sudo pacman -S nvidia-open
```
After Install, you should reboot to use 
**nvidia-smi** command。

## Display Server
> [Xorg Window System](https://wiki.archlinux.org/title/Xorg)

```
$ sudo pacman -S xorg xorg-server xorg-xinit
```

## dwm (Window manager)
> [dwm](https://dwm.suckless.org/)


```
git clone https://git.suckless.org/dwm  
```
或者使用我自己的配置：
```
$ git clone git@github.com:WGZ-W/st.git
``` 

Compile and install：
```
$ sudo make clean install
```
Use **startx** to start **dwm**.

Log and immediately into graphic environment, edit **`~/.bash_profile`** ，and add some content as follow:  
登录立即启动图形界面：
```
~/.bash_profile
------------------
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi
```

## st (terminal)
> [st](https://st.suckless.org/)


Using my own config:  
使用我自己的配置：
```
$ git clone git@github.com:WGZ-W/st.git
``` 

Download from offical site:  
从官方网站下载：
```
$ git clone https://git.suckless.org/st
```

Compile and install (first time need to install **pkg-config**):   
第一次需要安装 **pkg-config**： 
```
$ sudo pacman -S pkg-config

$ pkg-config --cflags freetype2

$ sudo make clean install
```
Use **shift+alt+enter** to start **st** terminal.

## dmenu (dynamic menu)
## slstatus (status monitor)
## feh (wallpaper)
```
$ feh --bg-fill /path/to/image.file
```
To restore the background on the next session, add the following to your startup file (e.g. **~/.xinitrc**)
```
~/.xinitrc
----------
~/.fehbg &
```

## neofetch
```
$ sudo pacman -S neofetch
```

## 双系统时间差异

```
$ timedatectl set-local-rtc 1
```
change to windows and synoc the time and everything is OK.
