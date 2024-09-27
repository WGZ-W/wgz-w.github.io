---
layout: post
title: "ArchLinux-4-GrubThemes"
tag: archlinux
---


# Grub-themes Installation
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

