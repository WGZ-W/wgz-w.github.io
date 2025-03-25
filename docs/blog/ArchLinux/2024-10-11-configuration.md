---
layout: post
title: "ArchLinux Configuration"
data: 2024-09-24 12:00
author: wgz
tag: archlinux
---

# ArchLinux Configuration

Recommand follow the [General recommendations](https://wiki.archlinux.org/title/General_recommendations#Graphical_user_interface), and this artical is just some supplements.

**Index**
- [ArchLinux Configuration](#archlinux-configuration)
  - [Graphical user interface](#graphical-user-interface)
    - [Display server](#display-server)
    - [Display drivers](#display-drivers)
    - [Desktop environments](#desktop-environments)
    - [Window managers or compositors](#window-managers-or-compositors)
  - [Font configuration/Chinese](#font-configurationchinese)
  - [Sound system](#sound-system)
    - [Advanced Linux Sound Architecture](#advanced-linux-sound-architecture)
    - [An example of setting default device using "defaults" node](#an-example-of-setting-default-device-using-defaults-node)
    - [JACK Audio Connection Kit](#jack-audio-connection-kit)
  - [Grub-themes Installation](#grub-themes-installation)

## Graphical user interface
### Display server
- Xorg
- Wayland

### Display drivers
- Nvidia

### Desktop environments
- 

### Window managers or compositors
- dwm

## Font configuration/Chinese
速速把所有能整上的免费字体都给整上
```
$ sudo pacman -S noto-fonts-cjk wqy-microhei wqy-microhei-lite wqy-bitmapfont
$ sudo pacman -S wqy-zenhei ttf-arphic-ukai ttf-arphic-uming adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
$ sudo pacman -S ttf-roboto noto-fonts ttf-dejavu.
```

## Sound system
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

## Grub-themes Installation
> [grub-themes](https://www.gnome-look.org/browse?cat=109)


Using `Acheron` theme as an example
1. Download & Extract:
```
tar -xzfv themes.tar.gz
```

2. Copy `Acheron` into grub themes directory
```
sudo cp -r Acheron /boot/grub/themes
```

3. Edit `grub` file
```
$ sudo vim /etc/default/grub
```

4. Add the theme to the bottom of the text file
```
GRUB_THEME="/boot/grub/themes/Acheron/theme.txt"
```

5. Update grub
```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

6. Reboot the computer.
