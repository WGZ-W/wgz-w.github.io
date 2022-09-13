# 安装 Arch

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
## 磁盘分区
## 格式化分区
## 挂载分区
## 选择镜像
## 安装必须的软件包
## 配置系统
## 安装引导程序
```
# grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=Arch

选择一个启动引导器标识，在本例被称为 Arch。这将在 esp/EFI/ 中创建一个与标识同名的目录来储存 EFI 二进制文件，而且这个名字还会用于在 UEFI 启动菜单中区分 GRUB 启动项；
执行下面的命令来将 GRUB EFI 应用 grubx64.efi 安装到 esp/EFI/Arch/，并将其模块安装到 /boot/grub/x86_64-efi/。

# grub-mkconfig -o /boot/grub/grub.cfg

使用 grub-mkconfig 工具来生成 /boot/grub/grub.cfg：




```