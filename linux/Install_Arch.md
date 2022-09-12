

1. 启动页面
```
e

nomodeset video=800*450
```

2. 修改字体
```
setfont /usr/share/kbd/consolefonts/LatGrkCyr-12x22.psfu.gz
```

3. 修改键位
```
keys.conf

keycode 1 = Caps_Lock
keycode 58 = Escape
```
```
$>  loadkeys keys.conf
```

4. 连接网络
```
$>  ip link

$> ip link set wlan0 up     打开WiFi设置

$> iwlist wlan0 scan       扫描WiFi结果

$> iwlist wlan0 scan | grep ESSID   WiFi名字

$> wpa_passphrase 网络 密码 > 文件名
$> wpa_passphrase WJDHH ..... > internet.conf
$> wpa_supplicant -c internet.conf -i wlan0 & \
    连接互联网，需要分配动态 IP 地址
$> dhcpcd &         动态分配 IP 地址
$> ping baidu.com
```

5. 确认时间
```
$> timedatectl set-ntp true
```

6. 分区
```
$> fdisk -l
```
```
$> mkfs.fat -F32 /dev/    引导分区格式

$> mkswap /dev/            制作 swap 分区
$> swapon /dev/             打开 swap
```

7. 修改镜像源配置文件
```
$> vim /etc/pacman.conf

1. 把 color 打开
2. Include  [community]，找到中国服务器，粘贴到文件的最顶端
```

8. 挂载
```
$> mount 主分区 /mnt
$> mkdir /mnt/boot
$> mount 引导分区   /mnt/boot

$> pacstrap /mnt base linux linux-firmware

$> genfstab -U /mnt >> /mnt/etc/fstab
```

9. 进入系统执行命令
```
$> arch-chroot /mnt

$> ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

$> hwclock --systohc    同步时间

$> exit
```

```
$> vim /mnt/etc/locale.gen
/en_US      取消注释

$> arch-chroot /mnt
$> locale-gen
$> exit
$> vim /mnt/etc/locale.conf

LANG=en_US.UTF-8
```





 