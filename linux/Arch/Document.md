# 安装 Arch

- [安装 Arch](#安装-arch)
  - [1 修改字体](#1-修改字体)
  - [2 连接网络](#2-连接网络)
  - [3 磁盘分区](#3-磁盘分区)
  - [4 格式化分区](#4-格式化分区)
  - [5 挂载分区](#5-挂载分区)
  - [（可选）文件验证（signature from...）(invalid or corrupted package)](#可选文件验证signature-frominvalid-or-corrupted-package)
  - [6 选择镜像](#6-选择镜像)
  - [7 安装必须的软件包](#7-安装必须的软件包)
  - [8 配置系统](#8-配置系统)
  - [9 安装引导程序](#9-安装引导程序)
  - [10 重启](#10-重启)
  - [11 安装后的工作](#11-安装后的工作)

## 1 修改字体
```
$> setfont /usr/share/kbd/consolefonts/LatGrkCyr-12x22.psfu.gz

在安装完成之后，永久修改字体
vim /etc/vconsole.conf
FONT=LatGrkCyr-12x22
重启即可
```

## 2 连接网络
```
查看网络设备
$ ip link

打开网络设备
# ip link set "interface" up


连接网络
iwctl --passphrase "passwd" station "device"(wlan0) connect WJ
```

## 3 磁盘分区
```
# gdisk

swap 分区 label 8200
EFI 分区 label  EF00
主分区 label 8300
```
## 4 格式化分区
```
# mkfs.xfs -f /dev/root_partition
# mkfs.fat -F 32 /dev/efi_system_partition
# mkswap /dev/swap_partition
```
## 5 挂载分区
```
# mount /dev/root_partition /mnt
# mount --mkdir /dev/efi_system_partition /mnt/boot
# swapon /dev/swap_partition

注意： 挂载分区一定要遵循顺序，先挂载根（root）分区（到 /mnt），再挂载引导（boot）分区（到 /mnt/boot 或 /mnt/efi，如果单独分出来了的话），最后再挂载其他分区。否则您可能遇到安装完成后无法启动系统的问题。
```

## （可选）文件验证（signature from...）(invalid or corrupted package)
```
需要下载
pacman -S archlinux-keyring
```
## 6 选择镜像
```
文件 /etc/pacman.d/mirrorlist 定义了软件包会从哪个镜像下载。
## Arch Linux repository mirrorlist
## China

Server = https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.cqu.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.dgut.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.neusoft.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.nju.edu.cn/archlinux/$repo/os/$arch
Server = https://mirror.redrock.team/archlinux/$repo/os/$arch
Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.xjtu.edu.cn/archlinux/$repo/os/$arch

在列表中越前的镜像在下载软件包时有越高的优先权。
这个文件接下来还会被 pacstrap 拷贝到新系统里，所以请确保设置正确。
```
## 7 安装必须的软件包
```
# pacstrap /mnt base linux linux-firmware vim dhcpcd networkmanager
```
## 8 配置系统
```
# genfstab -U /mnt >> /mnt/etc/fstab

# arch-chroot /mnt

# ln -sf /usr/share/zoneinfo/Region（地区名）/City（城市名） /etc/localtime
# hwclock --systohc

# locale-gen
# vim /etc/locale.conf
LANG=en_US.UTF-8

# vim /etc/hostname
zs

# passwd

# pacman -S man-db man-pages texinfo

# pacman -S grub efibootmgr intel-ucode os-prober

# systemctl enable NetworkManager.service
```
## 9 安装引导程序
```
# grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=Arch

选择一个启动引导器标识，在本例被称为 Arch。这将在 esp/EFI/ 中创建一个与标识同名的目录来储存 EFI 二进制文件，而且这个名字还会用于在 UEFI 启动菜单中区分 GRUB 启动项；
执行下面的命令来将 GRUB EFI 应用 grubx64.efi 安装到 esp/EFI/Arch/，并将其模块安装到 /boot/grub/x86_64-efi/。

# grub-mkconfig -o /boot/grub/grub.cfg

使用 grub-mkconfig 工具来生成 /boot/grub/grub.cfg：


警告： 这是安装的最后一步也是至关重要的一步，请按上述指引正确安装好引导加载程序后再重新启动。否则重启后将无法正常进入系统。
```

## 10 重启
```
输入 exit 或按 Ctrl+d 退出 chroot 环境。

可选用 umount -R /mnt 手动卸载被挂载的分区：这有助于发现任何「繁忙」的分区，并通过 fuser(1) 查找原因。

最后，通过执行 reboot 重启系统，systemd 将自动卸载仍然挂载的任何分区。不要忘记移除安装介质，然后使用 root 帐户登录到新系统。
```

## 11 安装后的工作
```

连接网络使用
$ nmtui

获取 sudo 命令
# pacman -S sudo

创建用户
sudo useradd -m "name"
sudo passwd "name"
sudo vim /etc/sudoers
在 user privilege 
和 root 这一行的权限一样

删除用户
sudo userdel -r "name"

修改镜像源同上

```