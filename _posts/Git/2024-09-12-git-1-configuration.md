---
layout: post
title: "Git's Configuration"
tag: git
---


# Configure Git

- [Configure Git](#configure-git)
  - [Install openssh](#install-openssh)
  - [Create a new ssh-key for Github](#create-a-new-ssh-key-for-github)



## Install openssh
```
$ sudo pacman -S openssh
```

## Create a new ssh-key for Github
```
$ ssh-keygen -t rsa -C "email"
```
Then put the content of `id_rsa_pub` into the setting of Github's SSH and GPG Keys.