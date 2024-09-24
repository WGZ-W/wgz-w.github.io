---
layout: post
title: "配置 ArchLinux 桌面环境"
tag: 
---

# 配置 Arch Linux 桌面
- [配置 Arch Linux 桌面](#配置-arch-linux-桌面)
  - [安装 Git](#安装-git)
  - [安装显卡驱动](#安装显卡驱动)
  - [安装 Xorg （显示服务）](#安装-xorg-显示服务)
  - [安装 Dwm](#安装-dwm)
  - [安装终端模拟器 （st）](#安装终端模拟器-st)
    - [半透明状态（alpha）](#半透明状态alpha)
  - [状态栏（slstatus）](#状态栏slstatus)
  - [程序启动器 （dmenu）](#程序启动器-dmenu)
  - [壁纸（feh）](#壁纸feh)
  - [查看系统配置（Search system configuration content）](#查看系统配置search-system-configuration-content)


> [从零开始配置自己的Arch Linux桌面（极简）](https://zhuanlan.zhihu.com/p/112536524)


## 安装 Git
```shell
$ sudo pacman -S git
```

## 安装显卡驱动
> [Nvidia 驱动安装](https://wiki.archlinux.org/title/NVIDIA)


```shell
查看显卡型号：
$ lspci -k | grep -A 2 -E "(VGA|3D)"

对于笔记本电脑，需要额外的程序支撑：
$ sudo pacman -S xf86-video-nouveau
$ sudo pacman -S nvidia-open

或者，对于台式机只有一个显卡的，直接安装：
$ sudo pacman -S nvidia-open
```
安装之后，应该需要重启才可以使用 `nvidia-smi` 命令。

## 安装 Xorg （显示服务）
> [Xorg 窗口系统](https://wiki.archlinux.org/title/Xorg)


```
$ sudo pacman -S xorg xorg-server xorg-xinit
```

## 安装 Dwm 
> [简单配置窗口管理器](https://zhuanlan.zhihu.com/p/408552473) 


克隆 dwm 源代码
```
## 浅层复制，节约带宽和硬盘空间
git clone https://git.suckless.org/dwm --depth=1  
```

编译并安装：
```
$ sudo make clean install
```

配置 `startx` ，让 X 窗口服务启动时自动运行 dwm 窗口管理器：
```
echo exec dwm >> ~/.xinitrc
```

修改 `config.def.h`，删除 `config.h` ，使用 `sudo make clean install` 重新编译安装， 使用快捷键 **`Alt+Shift+q`** 退出桌面环境， 然后再重新登录进入桌面环境就会发现修改便已经生效了， 就可以配置好 `dwm` 了。
dwm默认的功能按键是 `Alt` ,也就是说如果要使用快捷键来完成一些便捷操作的话，基本上我们都要按一下 `Alt` 键。因为 dwm 是窗口管理器嘛，我更喜欢用键盘上的 Windows 键来完成与窗口相关的操作。找到配置文件的当中的 `#define MODKEY`,把后面的内容调整为 `Mod4Mask`，这样后面所有用到 MODKEY 的快捷键就都按 Windows 键就可以了。

dwm 默认使用 `MODKEY+p` 启动 dmenu。不过在 Windows 系统上，我们都是使用 `Win+r` 启动运行对话框的。我们可以找到配置文件当中的`Static Key keys[]`，下面列出来的全部都是各种快捷键。我们可以把带有 `spawn dmenucmd` 字样的那一行当中的 `XK_p` 改为 `Xk_r` ,从此以后就可以使用 `Win+r` 组合键打开一个框，在里面输入程序名称就可以启动相应的程序了。

设置登录后自动进入图形环境，编辑 **`~/.bash_profile`** ，在文件最后补上如下内容:
```
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi
```
到了这一步，图形界面就安装完毕了，以后只要成功登录就会自动打开桌面环境。可以使用快捷键 **`shift+alt+enter`**  打开一个新的终端（如果你有终端模拟器的话，比如现在就没有终端模拟器，所以按这个快捷键是一点反应都没有）。

## 安装终端模拟器 （st）
> [简单配置终端模拟器](https://zhuanlan.zhihu.com/p/406153971)  


克隆 st 源代码
```
$ git clone https://git.suckless.org/st --depth=1
```
修改 `config.def.h`，删除 `config.h` ，使用 `sudo make clean install` 重新编译安装就可以配置好 `st` 了。

编译并安装（第一次需要安装 `pkg-config`）：
```
$ sudo pacman -S pkg-config
$ pkg-config --cflags freetype2
$ sudo make clean install
```
安装好 `st` 以后就可以使用 `startx` 进入图形界面，然后使用 `shift+alt+enter` 打开终端了。

### 半透明状态（alpha）
首先，我们需要安装一个系统依赖项 `picom`。
```
$ sudo pacman -S picom
```
安装完毕之后还需要用 `picom &` 来启动它，可以将该语句加入 `.xinitrc` 当中，让我们在每次启动图形界面的同时自动启动它。
```
$ vim .xinitrc

picom &
```
从 `suckless` 的官网上下载 `最新` 的 `alpha` 补丁
> [Alpha diff](https://st.suckless.org/patches/alpha/)

然后 `cd` 到 `st` 的源文件目录下，使用 `patch` 命令把补丁文件应用到配置文件上。
```
$ patch  < /path/to/patch.diff
```
> 由于代码更新，补丁可能无法完全补充到对应的文件中，这时候就需要根据 `.rej` 文件来手动修改相应文件。


`alpha` 补丁在 `config.def.h` 当中添加了一个 `alpha`变量，大家可以修改该数值取得不同程度的透明效果，数值越小越透明，数值越大越不透明。


## 状态栏（slstatus）
```
$ git clone https://git.suckless.org/slstatus 
```


## 程序启动器 （dmenu）
dwm 这个窗口管理器没有提供任何一个按钮给大家点，只能在终端中通过键入程序名的方式启动程序。但是这种启动方式会有一个终端窗口停留在屏幕上，关掉这个终端窗口还会造成程序的立即退出。所以推荐大家使用 dmenu ，使用 `Alt+p` 可以在 dwm 中打开 dmenu ，然后输入程序名称可以启动相应程序，但不会产生终端窗口。
```
$ sudo pacman -S dmenu
```

## 壁纸（feh）
```
$ sudo pacman -S feh
```
进入图片下载目录，使用：
```
$ feh --bg-fill /path/image
```
下次登录的时候，设置好的壁纸又会失效，需要在 **`~/.xinitrc`** 中添加一行，使其能在启动图形界面后自动设置壁纸。
```
$ vim .xinitrc

~/.fehbg &
```

## 查看系统配置（Search system configuration content）
```
$ sudo pacman -S neofetch
```
To use, type:
```
$ neofetch
```



