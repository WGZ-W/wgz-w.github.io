---
layout: post
title: ArchLinux-Configuration
data: 2024-09-24 12:00
author: wgz
tag: archlinux
---

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

### JACK Audio Connection Kit
```
$ sudo pacman -S jack2

# Starting the audio graph 
$ jackd
```