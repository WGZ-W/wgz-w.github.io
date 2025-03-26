---
date:
  created: 2024-09-12
layout: post
title: "Git's Configuration"
tag: git
---


# Configure Git


## Install openssh
```
$ sudo pacman -S openssh
```

## Create a new ssh-key for Github
```
$ ssh-keygen -t rsa -C "email"
```
Then put the content of `id_rsa_pub` into the setting of Github's SSH and GPG Keys.