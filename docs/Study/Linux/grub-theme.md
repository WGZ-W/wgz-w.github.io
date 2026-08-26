
# Grub Theme Installation

> [Grub Themes](https://www.gnome-look.org/browse?cat=109)


Using `Acheron` theme as an example.

-  Download & Extract:

```
$ tar -xzfv themes.tar.gz
```

- Copy `Acheron` into grub themes directory
```
$ sudo cp -r Acheron /boot/grub/themes
```

- Edit the `grub` file
```
$ sudo vim /etc/default/grub
```

- Add the theme to the bottom of the text file
```
GRUB_THEME="/boot/grub/themes/Acheron/theme.txt"
```

- Update grub
```
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
```

- Reboot the computer.

