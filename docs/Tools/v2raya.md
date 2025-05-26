---
layout: post
title: V2raya
tag: tools
---

# V2raya
- [鹏叔的技术博客](https://pengtech.net/network/v2rayA_install.html)
- [v2rayA教程](https://yang-d19.github.io/v2rayA%E6%95%99%E7%A8%8B/)

## Installation
v2rayA 的功能依赖于 V2Ray 内核，因此需要安装内核。
### Linux 上下载并安装 v2ray 内核:
```

## 下载v2ray-core，
$ wget -O v2ray-linux-64.zip https://ghproxy.net/https://github.com/v2fly/v2ray-core/releases/download/v5.13.0/v2ray-linux-64.zip

# 核对文件的指纹信息, 如果与以下输出一致则表示，否则请谨慎安装。
# 指纹信息可以在https://github.com/v2fly/v2ray-core/releases/download/v5.13.0/v2ray-linux-64.zip.dgst中找到
$ openssl dgst -SHA2-256 v2ray-linux-64.zip
SHA2-256(v2ray-linux-64.zip)= 0341c1bf809afd42016d748e2e7e68a9b3c6aad501529794ad56a877a7ba75aa

# 将其解压到/usr/local/v2ray-core， 需要root权限
sudo unzip v2ray-linux-64.zip -d /usr/local/v2ray-core

# 将.dat文件拷贝到/usr/local/share/v2ray/
sudo mkdir -p /usr/local/share/v2ray/
sudo mv /usr/local/v2ray-core/*dat /usr/local/share/v2ray/
```

### Install v2raya
在 Github 上下载 **installer_archlinux_x64_2.2.6.pkg.tar.zst** 然后安装：
```
$ sudo pacman -U installer_archlinux_x64_2.2.6.pkg.tar.zst
```


## 配置 v2rayA 
### 配置 v2rayA
```
/etc/default/v2raya
----------------------------------------------
# 将 V2rayA 和 v2ray-core 关联起来
# 添加配置两行配置
V2RAYA_V2RAY_BIN=/usr/local/v2ray-core/v2ray
V2RAYA_V2RAY_CONFDIR=/usr/local/v2ray-core
```

### 设置开机启动
```
# --now 参数表示设置为开机启动并立即启动 v2raya
$ sudo systemctl enable --now v2raya
# 查看服务状态
$ systemctl status v2raya
```

在浏览器中打开 v2rayA web 管理界面 http://localhost:2017/