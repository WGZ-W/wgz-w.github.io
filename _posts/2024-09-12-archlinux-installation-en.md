---
layout: post
title: "ArchLinux Installation English" 
---



# 安装 Arch

- [安装 Arch](#安装-arch)
- [Arch Wiki Installation guide ](#arch-wiki-installation-guide-)
  - [1 Pre-installation](#1-pre-installation)
    - [1.1 Set the console keyboard font](#11-set-the-console-keyboard-font)
    - [1.2 Connect to the internet](#12-connect-to-the-internet)
    - [1.3 Update the system clock](#13-update-the-system-clock)
    - [1.4 Partition the disks](#14-partition-the-disks)
      - [1.4.1 Example layouts](#141-example-layouts)
    - [1.5 Format the partitions](#15-format-the-partitions)
    - [1.6 Mount the file systems](#16-mount-the-file-systems)
  - [2 Installation](#2-installation)
    - [2.1 Select the mirrors](#21-select-the-mirrors)
    - [2.2 文件验证 (invalid or corrupted package)](#22-文件验证-invalid-or-corrupted-package)
    - [2.3 Install essential packages](#23-install-essential-packages)
  - [3 Configure the system](#3-configure-the-system)
    - [3.1 Fstab](#31-fstab)
    - [3.2 Chroot](#32-chroot)
    - [3.3 Time zone](#33-time-zone)
    - [3.4 Localization](#34-localization)
    - [3.5 Network configuration](#35-network-configuration)
    - [3.6 Root password](#36-root-password)
    - [3.7 Boot loader](#37-boot-loader)
      - [3.7.1 安装引导程序 Install boot loader](#371-安装引导程序-install-boot-loader)
  - [4 Reboot](#4-reboot)
  - [5 Post-installation](#5-post-installation)

# [Arch Wiki Installation guide ](https://wiki.archlinux.org/title/Installation_guide)
## 1 Pre-installation
### 1.1 Set the console keyboard font
```shell
# setfont ter-132b
```

### 1.2 Connect to the internet
Ensure your network interface is listed and enabled, for example with ip-link:
```shell
# ip link
```

Wi-Fi—authenticate to the wireless network using iwctl.
```shell
# iwctl
[iwd]# device list
[iwd]# station [name] scan
[iwd]# station [name] get-networks
[iwd]# station [name] connect [SSID]
[iwd]# device [device] show
```
or you can supple it as a command line argument
```shell
# iwctl --passphrase passphrase station name connect SSID
```

The connection may be verified with ping
```shell
# ping archlinux.org
```

### 1.3 Update the system clock
Use timedatectl(1) to ensure the system clock is accurate:
```shell
# timedatectl
```

### 1.4 Partition the disks
When recognized by the live system, disks are assigned to a `block device` such as `/dev/sda`, `/dev/nvme0n1` or `/dev/mmcblk0`. To identify these devices, use `lsblk or fdisk`.
```shell
# lsblk
# fdisk -l | less
```
Results ending in rom, loop or airoot may be ignored.  
The following partitions are required for a chosen device:  
- One partition for the root directory `/`.
- For booting in UEFI mode: `an EFI system partition`.  
- Store boot file in `/boot`
- User own directory `/home`

Use `gdisk` or `parted` to modify partition tables. For example:
```shell
# gdisk /dev/the_disk_to_be_partitioned
```
> Note:  
> If the disk from which you want to boot `already has an EFI system partition`, do not create another one, but use the existing partition instead.

#### 1.4.1 Example layouts
`UEFI with GPT`

| Mount point |     Partition         | Suggested size  |
| ----------- | -------------------   | --------------- |
|    /boot    | /dev/boot_partition   | More than 1GiB   |
|     /       | /dev/root_partition   | More   |  
|    /home    | /dev/home_partition   | More   |
|  /boot/efi  | /dev/efi_system_partition | Less than 1GiB |
|   [SWAP]    | /dev/swap_partition   | Same as Memory   |

### 1.5 Format the partitions
Once the partitions have been created, each newly created partition must be formatted with an appropriate `file system`. See `File systems#Create a file system` for details.  
For example, to create an XFS file system on /dev/root_partition, run:
```shell
# mkfs.xfs -f /dev/root_partition
# mkfs.xfs -f /dev/boot_partition
# mkfs.xfs -f /dev/home_partition
```
If you created a partition for swap, initialize it with mkswap(8):
```shell
# mkswap /dev/swap_partition
```
> Note: For stacked block devices replace `/dev/*_partition` with the appropriate block device path.  

If you created an EFI system partition, format it to FAT32 using mkfs.fat.
> Warning: Only format the EFI system partition if you created it during the partitioning step. If there already was an EFI system partition on disk beforehand, reformatting it can destroy the boot loaders of other installed operating systems.

```shell
# mkfs.fat -F 32 /dev/efi_system_partition
```

### 1.6 Mount the file systems
Mount the root volume to /mnt. For example, if the root volume is /dev/root_partition:
```shell
# mount /dev/root_partition /mnt
```
Create any remaining mount points (such as /mnt/boot) and mount the volumes in their corresponding hierarchical order.
> Tip: Run mount(8) with the --mkdir option to create the specified mount point. Alternatively, create it using mkdir(1) beforehand.

For UEFI systems, mount the EFI system partition:
```shell
# mount --mkdir /dev/boot_partition /mnt/boot
# mount --mkdir /dev/efi_system_partition /mnt/boot/efi
# mount --mkdir /dev/home_partition /mnt/home
```
If you created a swap volume, enable it with swapon(8):
```shell
# swapon /dev/swap_partition
```
> 注意： 挂载分区一定要遵循顺序，先挂载根（root）分区（到 /mnt），再挂载引导（boot）分区（到 /mnt/boot 或 /mnt/efi，如果单独分出来了的话），最后再挂载其他分区。否则您可能遇到安装完成后无法启动系统的问题。


## 2 Installation
### 2.1 Select the mirrors
文件 `/etc/pacman.d/mirrorlist` 定义了软件包会从哪个镜像下载。
将中国的镜像放在最上边。在列表中越前的镜像在下载软件包时有越高的优先权。
```shell
# vim /etc/pacman.d/mirrorlist

Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.nju.edu.cn/archlinux/$repo/os/$arch

# sudo pacman -Syyu
```
这个文件接下来还会被 pacstrap 拷贝到新系统里，所以请确保设置正确。

### 2.2 文件验证 (invalid or corrupted package)
```shell
# pacman -Sy archlinux-keyring
```

### 2.3 Install essential packages
> Note: No software or configuration (except for `/etc/pacman.d/mirrorlist`) get carried over from the live environment to the installed system.

Use the pacstrap(8) script to install the base package, Linux kernel and firmware for common hardware:
```shell
# pacstrap /mnt base linux linux-firmware vim networkmanager
```


## 3 Configure the system

### 3.1 Fstab
Generate an fstab file (use -U or -L to define by UUID or labels, respectively):
```shell
# genfstab -U /mnt >> /mnt/etc/fstab
```
Check the resulting /mnt/etc/fstab file, and edit it in case of errors.

### 3.2 Chroot
Change root into the new system:
```shell
# arch-chroot /mnt
```

### 3.3 Time zone
Set the time zone:
```shell
# ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
```
Run hwclock to generate /etc/adjtime:
```shell
# hwclock --systohc   同步时间
```
This command assumes the hardware clock is set to UTC. See System time#Time standard for details.

### 3.4 Localization
Edit /etc/locale.gen and **uncomment** en_US.UTF-8 UTF-8 and other needed locales. Generate the locales by running:
```shell
# vim /etc/locale.gen
en_US.UTF-8 UTF-8

# locale-gen
```
Create the locale.conf(5) file, and set the LANG variable accordingly:
```shell
# vim /etc/locale.conf
LANG=en_US.UTF-8
```
If you set the console keyboard layout, make the changes persistent in `/etc/vconsole.conf`:  
```shell
# vim /etc/vconsole.conf
FONT=LatGrkCyr-12x22
```

### 3.5 Network configuration
Create the hostname file:
```shell
# vim /etc/hostname
hostname
```
Complete the network configuration for the newly installed environment. That may include installing suitable `network management` software.  
edit the /etc/hosts file for every device in your LAN, see hosts. 
Examples:
```shell
# The following lines are desirable for IPv4 capable hosts
127.0.0.1       localhost
# 127.0.1.1 is often used for the FQDN of the machine
127.0.1.1       thishost.example.org   thishost
192.168.1.10    foo.example.org        foo
192.168.1.13    bar.example.org        bar
146.82.138.7    master.debian.org      master
209.237.226.90  www.opensource.org
# The following lines are desirable for IPv6 capable hosts
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
```

### 3.6 Root password
Set the root password:
```shell
# passwd
```

### 3.7 Boot loader
```shell
# pacman -S man-db man-pages texinfo
# pacman -S grub efibootmgr intel-ucode os-prober
```

Start the NetwrokManager Service 
```shell
# systemctl enable NetworkManager.service
# systemctl start NetworkManager.service
```
#### 3.7.1 安装引导程序 Install boot loader
esp = EFI system partition  
```shell
# grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=Arch
```

使用 `grub-mkconfig` 工具来生成 `/boot/grub/grub.cfg`：
```shell
# grub-mkconfig -o /boot/grub/grub.cfg
```

> Warning : 第一次也许不能检测到Windows，重启之后再把 `esp` 挂载到 `/boot/efi` ,再次输入 `grub-mkconfig -o /boot/grub/grub.cfg` 命令应该可以检测到Windows。


## 4 Reboot
```shell
# exit

# umount -R /mnt

# reboot
```

## 5 Post-installation
Login, use the **root** user  

Connect network
```shell
# nmtui
```

Get **sudo** command
```shell
# pacman -S sudo
```

Create user
```shell
# sudo useradd -m "name"
# sudo passwd "name"
# sudo vim /etc/sudoers  在 user privilege，将创建的用户和 root 这一行的权限一样
```

