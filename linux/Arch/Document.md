# 安装 Arch

- [安装 Arch](#安装-arch)
  - [连接网络](#连接网络)
  - [连接网络2](#连接网络2)
  - [磁盘分区](#磁盘分区)
  - [格式化分区](#格式化分区)
  - [挂载分区](#挂载分区)
  - [选择镜像](#选择镜像)
  - [安装必须的软件包](#安装必须的软件包)
  - [配置系统](#配置系统)
  - [安装引导程序](#安装引导程序)
  - [重启](#重启)
  - [安装后的工作](#安装后的工作)
## 连接网络
```
查看网络设备
$ ip link

打开网络设备
# ip link set interface up
# ip link set wlan0 up
# ip link set wlp2s0 up

连接网络
# wpa_passphrase MYSSID passphrase > /etc/wpa_supplicant/internet.conf
# wpa_supplicant -B -i interface -c /etc/wpa_supplicant/internet.conf
# dhcpcd interface
```

## 连接网络2
```
iwctl --passphrase `passphrase` station `device` connect SSID(网络名称) 
```
## 磁盘分区
```
# gdisk
```
## 格式化分区
```
# mkfs.xfs /dev/root_partition
# mkfs.fat -F 32 /dev/efi_system_partition
# mkswap /dev/swap_partition
```
## 挂载分区
```
# mount /dev/root_partition /mnt
# mount --mkdir /dev/efi_system_partition /mnt/boot
# swapon /dev/swap_partition

注意： 挂载分区一定要遵循顺序，先挂载根（root）分区（到 /mnt），再挂载引导（boot）分区（到 /mnt/boot 或 /mnt/efi，如果单独分出来了的话），最后再挂载其他分区。否则您可能遇到安装完成后无法启动系统的问题。
```
## 选择镜像
```
文件 /etc/pacman.d/mirrorlist 定义了软件包会从哪个镜像下载。
在列表中越前的镜像在下载软件包时有越高的优先权。
这个文件接下来还会被 pacstrap 拷贝到新系统里，所以请确保设置正确。
```
## 安装必须的软件包
```
# pacstrap /mnt base linux linux-firmware vim dhcpcd 
```
## 配置系统
```
# genfstab -U /mnt >> /mnt/etc/fstab

# arch-chroot /mnt

# ln -sf /usr/share/zoneinfo/Region（地区名）/City（城市名） /etc/localtime
# hwclock --systohc

# vim /etc/hostname

# passwd

# pacman -S man-db man-pages texinfo

# pacman -S grub efibootmgr
```
## 安装引导程序
```
# grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=Arch

选择一个启动引导器标识，在本例被称为 Arch。这将在 esp/EFI/ 中创建一个与标识同名的目录来储存 EFI 二进制文件，而且这个名字还会用于在 UEFI 启动菜单中区分 GRUB 启动项；
执行下面的命令来将 GRUB EFI 应用 grubx64.efi 安装到 esp/EFI/Arch/，并将其模块安装到 /boot/grub/x86_64-efi/。

# grub-mkconfig -o /boot/grub/grub.cfg

使用 grub-mkconfig 工具来生成 /boot/grub/grub.cfg：


警告： 这是安装的最后一步也是至关重要的一步，请按上述指引正确安装好引导加载程序后再重新启动。否则重启后将无法正常进入系统。
```

## 重启
```
输入 exit 或按 Ctrl+d 退出 chroot 环境。

可选用 umount -R /mnt 手动卸载被挂载的分区：这有助于发现任何「繁忙」的分区，并通过 fuser(1) 查找原因。

最后，通过执行 reboot 重启系统，systemd 将自动卸载仍然挂载的任何分区。不要忘记移除安装介质，然后使用 root 帐户登录到新系统。
```

## 安装后的工作
```
创建非特权帐户、图形用户界面的安装、声音管理、触摸板支持等系统管理教程和后期工作参见 General recommendations (简体中文)。

感兴趣的各类程序，请参见 List of applications (简体中文)。
```