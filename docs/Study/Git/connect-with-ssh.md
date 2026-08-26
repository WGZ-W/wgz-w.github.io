---
date:
  created: 2024-09-12

title: "Connect With SSH"
tag: git
---


# Connect With SSH


## Install openssh
```
$ sudo pacman -S openssh
```


## Create a new ssh-key for Github
```
$ ssh-keygen -t rsa -C "email"
```
Then put the content of `id_rsa_pub` into the setting of Github's SSH and GPG Keys.


## See Also
- [Authentication documentation](https://docs.github.com/en/authentication)