---
title: ArchLinux-1-Installation
data: 2024-09-21 12:00
author: wgz
tag: archlinux
---


Recommand follow the [Installation_guide](https://wiki.archlinux.org/title/Installation_guide), and this artical is just some supplements.

**Index**
- [Console fonts](#console-fonts)
- [Connect the internet](#connect-the-internet)
- [Update the system clock](#update-the-system-clock)
- [Partition the disks](#partition-the-disks)
- [My partition layout:](#my-partition-layout)
- [Format partitions](#format-partitions)
- [Mount the file systems](#mount-the-file-systems)
- [Select the mirrors](#select-the-mirrors)
- [File validation](#file-validation)
- [Install essential packages](#install-essential-packages)
- [Fstab](#fstab)
- [Chroot](#chroot)
- [Time zone](#time-zone)
- [Localization](#localization)
- [Set the console keyboard layout](#set-the-console-keyboard-layout)
- [Network configuration](#network-configuration)
- [Root password](#root-password)
- [Boot loader](#boot-loader)
- [Install boot loader](#install-boot-loader)
- [Reboot](#reboot)
- [Start the NetwrokManager Service](#start-the-netwrokmanager-service)
- [Add new user](#add-new-user)


# Console fonts
```
# setfont ter-132b
```

# Connect the internet
Using iwctl to connect the wireless network:
```
# ip link
# iwctl

[iwd]# device list
[iwd]# station [name] scan
[iwd]# station [name] get-networks
[iwd]# station [name] connect [SSID]
[iwd]# station [device] show

# ping archlinux.org
```

# Update the system clock
```
# timedatectl
```

# Partition the disks
```
# fdisk -l | less

# gdisk /dev/the_disk_to_be_partitioned
```

# My partition layout:
| Mount point | Partition                 | Suggested size |
| ----------- | ------------------------- | -------------- |
| /boot       | /dev/boot_partition       | More than 1GiB |
| /           | /dev/root_partition       | More           |
| /home       | /dev/home_partition       | More           |
| /boot/efi   | /dev/efi_system_partition | Less than 1GiB |
| [SWAP]      | /dev/swap_partition       | Same as Memory |

# Format partitions
```shell
# mkfs.xfs -f /dev/root_partition
# mkfs.xfs -f /dev/boot_partition
# mkfs.xfs -f /dev/home_partition

# mkswap /dev/swap_partition
```

# Mount the file systems
```
# mount /dev/root_partition /mnt

# mount --mkdir /dev/efi_system_partition /mnt/boot

# swapon /dev/swap_partition
```

# Select the mirrors
```shell
/etc/pacman.d/mirrorlist
------------------------------
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.nju.edu.cn/archlinux/$repo/os/$arch

# sudo pacman -Syyu
```

# File validation
```shell
# pacman -Sy archlinux-keyring
```

# Install essential packages
```
# pacstrap -K /mnt base linux linux-firmware neovim networkmanager vim
```

# Fstab
```
# genfstab -U /mnt >> /mnt/etc/fstab
```

# Chroot
```
# arch-chroot /mnt
```

# Time zone
Set the time zone:
```shell
# ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# hwclock --systohc
```

# Localization
Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8 and other needed UTF-8 locales.Generate the locales by running:  
编辑 **/etc/locale.gen** 并且取消注释 **en_US.UTF-8 UTF-8**：
```
# locale-gen
```

Create the locale.conf file:
```
/etc/locale.conf
----------------------
LANG=en_US.UTF-8
```


# Set the console keyboard layout
```shell
/etc/vconsole.conf
------------------------
FONT=LatGrkCyr-12x22
```

# Network configuration
```
/etc/hostname
------------------
WGZ
```

# Root password
```
# passwd
```

# Boot loader
```shell
# pacman -S man-db man-pages texinfo
# pacman -S grub efibootmgr intel-ucode os-prober
```

# Install boot loader
esp = EFI system partition  
mount the esp into **`/boot/efi`**
```shell
# mount --mkdir /dev/[name] /boot/efi

# grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Arch

# grub-mkconfig -o /boot/grub/grub.cfg
```

# Reboot
```
# exit
# umount -R /mnt
# reboot
```

# Start the NetwrokManager Service 
```shell
# systemctl enable NetworkManager
# systemctl start NetworkManager
```

# Add new user
```shell
# pacman -S sudo
# sudo useradd -m [name]
# sudo passwd [name]

/etc/sudoers  
-----------------------
root ALL:(ALL:ALL)...
name ALL:(ALL:ALL)...
```


