---
layout: post
title: "ArchLinux 安装" 
tag: 
---



# 安装 Arch

- [安装 Arch](#安装-arch)
  - [1 安装前准备](#1-安装前准备)
    - [1.1 设置控制台字体](#11-设置控制台字体)
    - [1.2 连接网络](#12-连接网络)
    - [1.3 更新系统时间](#13-更新系统时间)
    - [1.4 磁盘分区](#14-磁盘分区)
      - [1.4.1 布局示例](#141-布局示例)
    - [1.5 格式化分区](#15-格式化分区)
    - [1.6 挂载文件系统](#16-挂载文件系统)
  - [2 安装](#2-安装)
    - [2.1 选择镜像源](#21-选择镜像源)
    - [2.2 文件验证 (invalid or corrupted package)](#22-文件验证-invalid-or-corrupted-package)
    - [2.3 安装基础软件包](#23-安装基础软件包)
  - [3 配置系统](#3-配置系统)
    - [3.1 Fstab](#31-fstab)
    - [3.2 Chroot](#32-chroot)
    - [3.3 时区](#33-时区)
    - [3.4 本地化](#34-本地化)
    - [3.5 Network configuration](#35-network-configuration)
    - [3.6 Root password](#36-root-password)
    - [3.7 Boot loader](#37-boot-loader)
      - [3.7.1 安装引导程序 Install boot loader](#371-安装引导程序-install-boot-loader)
  - [4 Reboot](#4-reboot)
  - [5 Post-installation](#5-post-installation)

> [Arch Wiki 安装指南 ](https://wiki.archlinux.org/title/Installation_guide)
## 1 安装前准备
### 1.1 设置控制台字体
```shell
# setfont ter-132b
```

### 1.2 连接网络
确保网络接口被列出并且可以使用：
```shell
# ip link
```

WiFi连接使用 iwctl 。
```shell
# iwctl
[iwd]# device list
[iwd]# station [name] scan
[iwd]# station [name] get-networks
[iwd]# station [name] connect [SSID]
[iwd]# device [device] show
```

或者可以使用它作为命令参数：
```shell
# iwctl --passphrase passphrase station name connect SSID
```

验证连接使用 ping：
```shell
# ping archlinux.org
```

### 1.3 更新系统时间
使用 timedatectl 保证系统时间是正确的：
```shell
# timedatectl
```

### 1.4 磁盘分区
当被安装系统识别到，磁盘会被分配到 block device，比如 `/dev/sda`，`/dev/nvme0n1`，等等，为了辨别这些设备，使用 `lsblk` 或者 `fdisk` :
```shell
# lsblk
# fdisk -l | less
```
显示结果以 rom，loop，或者 airoot 结尾的可以忽略。  
下面的几个分区是必须的：
- One partition for the root directory `/`.
- For booting in UEFI mode: `an EFI system partition`.  
- Store boot file in `/boot`
- User own directory `/home`

使用 `gdisk` or `parted` 去修改分区表：
```shell
# gdisk /dev/the_disk_to_be_partitioned
```
> 注意:  
> 如果你想启动的磁盘已经有了一个 `EFI system partition`，不用创建另一个，用当前的就可以。


#### 1.4.1 布局示例
`UEFI with GPT`

| Mount point |     Partition         | Suggested size  |
| ----------- | -------------------   | --------------- |
|    /boot    | /dev/boot_partition   | More than 1GiB   |
|     /       | /dev/root_partition   | More   |  
|    /home    | /dev/home_partition   | More   |
|  /boot/efi  | /dev/efi_system_partition | Less than 1GiB |
|   [SWAP]    | /dev/swap_partition   | Same as Memory   |

### 1.5 格式化分区
一旦分区被创建，每个新的分区都必须被格式化成正确的 `file system`。  
比如，创建一个 XFS 文件系统在 `/dev/root_partition` ：

```shell
# mkfs.xfs -f /dev/root_partition
# mkfs.xfs -f /dev/boot_partition
# mkfs.xfs -f /dev/home_partition
```
如果你创建了一个 swap 分区，使用 mkswap 初始化它：
```shell
# mkswap /dev/swap_partition
```
如果你创建了一个 `EFI system partition`，使用 mkfs.fat 将它格式化为 FAT32

> 警告：只能格式化你在磁盘分区时创建的 EFI system partition 。如果之前就有 EFI system partition，重新格式化该分区会摧毁其他操作系统安装的启动引导器。
```shell
# mkfs.fat -F 32 /dev/efi_system_partition
```

### 1.6 挂载文件系统
挂载 root volume 到 `/mnt` 。比如，如果 root volume 是 `/dev/root_partition`:
```shell
# mount /dev/root_partition /mnt
```
创建任何保留的分区 （such as /mnt/boot）并且按照相应顺序进行挂载。

> 提示：运行 mount 和 选项 --mkdir 可以创建一个指定的挂载点。

对于 `UEFI systems`, 挂载 `EFI system partition`:
```shell
# mount --mkdir /dev/boot_partition /mnt/boot
# mount --mkdir /dev/efi_system_partition /mnt/boot/efi
# mount --mkdir /dev/home_partition /mnt/home
```
If you created a swap volume, enable it with swapon(8):
如果你创建了一个交换分区，执行 swapon 使用该分区：
```shell
# swapon /dev/swap_partition
```
> 注意： 挂载分区一定要遵循顺序，先挂载根（root）分区（到 /mnt），再挂载引导（boot）分区（到 /mnt/boot 或 /mnt/efi，如果单独分出来了的话），最后再挂载其他分区。否则您可能遇到安装完成后无法启动系统的问题。


## 2 安装
### 2.1 选择镜像源
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

### 2.3 安装基础软件包
> 注意：没有软件或者配置（除了 `/etc/pacman.d/mirrorlist`）从安装环境被运送到被安装的系统。  

使用 pacstrap 脚本去安装基础软件包，Linux 内核和 firmware 对于普遍的硬件。

```shell
# pacstrap /mnt base linux linux-firmware vim networkmanager
```

## 3 配置系统

### 3.1 Fstab
生成一个 fstab file (use -U or -L to define by UUID or labels, respectively):
```shell
# genfstab -U /mnt >> /mnt/etc/fstab
```
检查结果 `/mnt/etc/fstab file`，并且如果错误就编辑它。

### 3.2 Chroot
更改 root 进入新系统：
```shell
# arch-chroot /mnt
```

### 3.3 时区
设置时区：
```shell
# ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
```
运行 `hwclock` 去生成 `/etc/adjtime`:
```shell
# hwclock --systohc   同步时间
```
这个命令假设硬件时间被设置为 UTC。


### 3.4 本地化
编辑 `/etc/locale.gen` 并且取消注释 `en_US.UTF-8 UTF-8` 和其他需要的语系。
运行下面命令生成语系：
```shell
# vim /etc/locale.gen
en_US.UTF-8 UTF-8

# locale-gen
```
创建 `locale.conf` 文件, and set the LANG variable accordingly:
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

