---
layout: post
title: "archlinux' some useful application" 
---

# 安装一些便利的程序

- [安装一些便利的程序](#安装一些便利的程序)
  - [代码编辑器（neovim）](#代码编辑器neovim)
  - [文件管理器（ranger）](#文件管理器ranger)
  - [网络代理（QV2ray）](#网络代理qv2ray)
  - [网上冲浪（火狐浏览器）](#网上冲浪火狐浏览器)
  - [中文字体](#中文字体)
  - [声音输出（alsa-utils）](#声音输出alsa-utils)
  - [电源管理器（mate-power-manager）](#电源管理器mate-power-manager)
  - [中文输入法（fcitx5）](#中文输入法fcitx5)
  - [PDF阅读器（Zathura）](#pdf阅读器zathura)
  - [安装paru](#安装paru)
  - [Edge浏览器](#edge浏览器)


## 代码编辑器（neovim）
因为 Arch Linux 上直接使用 pacman 安装的 vim 是-clipboard，无法使用系统剪贴板。解决办法就是用 neovim 顶掉 vim ，不过不用担心，安装了 neovim 后还是可以在命令行里使用 vim 的，只不过这个 vim 就有 +clipboard 了。
```
$ sudo pacman -S neovim
```

## 文件管理器（ranger）
```
$ sudo pacman -S ranger
```
ranger 有一个实用功能是图片预览，就是当我们当前选择的项目如果是图片的话，它会自动在屏幕的最右侧打开这张图片，非常方便我们选择图片。
```
# 复制默认的配置文件到家目录下
$ ranger --copy-config=all

# 切换到配置文件夹当中
$ cd ~/.config/ranger
```

我们需要修改 **`rc.conf`** 这个文件，首先找到 `set preview_images false` 这一行，把 `false` 改为 `true` 打开图片预览的选项 ，然后找到 `set preview_images_method w3m` 这一行，把默认的 `w3m` 改为 `ueberzug` 。最后，我们把 `ueberzug` 这个命令安装上就可以完成工作了。
```
$ sudo pacman -S ueberzug
```
这边之所以会选择使用 `ueberzug` 来预览图片，而不是默认的 `w3m` ，是因为这个在我的电脑上无法完成工作，如果老铁们可以用 `w3m` 预览图片的话，那自然是不需要调整预览方式的。当然了，选择 `w3m` 就要把它安装到系统当中了哈：
```
$ sudo pacman -S w3m
```

显示隐藏文件：
```
$ vim rc.conf

set show_hidden true
```


## 网络代理（QV2ray）

## 网上冲浪（火狐浏览器）
```
$ sudo pacman -S firefox
```
当然啦，火狐浏览器不是大多数人的第一选择，比如我现在用的就是新版Edge浏览器。但是火狐浏览器是在官方仓库里面的，别的浏览器都不在官方仓库里面，先安装一个火狐浏览器上上网先，回头再安装别的浏览器。比如之前你需要用另一台电脑或手机看这个攻略贴，有了火狐浏览器，你就可以直接在电脑上看这个攻略贴了，复制命令什么的方便多了呢。  
顺便提一句，在终端模拟器里面粘贴内容请使用 `Shift+Ctrl+V` ，简单的 `Ctrl+V` 是没有用的。  
因为这个还没有安装中文字体嘛，所以打开网页的时候，我们看到的中文文字可能都是方块乱码，这个时候我们需要安装上一些中文字体，然后再重启火狐浏览器就可以了。


顺便提一句，在终端模拟器里面粘贴内容请使用 `Shift+Ctrl+V` ，简单的 `Ctrl+V` 是没有用的。  
因为这个还没有安装中文字体嘛，所以打开网页的时候，我们看到的中文文字可能都是方块乱码，这个时候我们需要安装上一些中文字体，然后再重启火狐浏览器就可以了。

## 中文字体
速速把所有能整上的免费字体都给整上
```
$ sudo pacman -S noto-fonts-cjk wqy-microhei wqy-microhei-lite wqy-bitmapfont
$ sudo pacman -S wqy-zenhei ttf-arphic-ukai ttf-arphic-uming adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
```

## 声音输出（alsa-utils）
```
$ sudo pacman -S alsa-utils pulseaudio-alsa
```
如果电脑没有发出声音来，可能是因为声卡在默认情况下被静音了，可以使用 `alsamixer` 打开声音，然后还可以在这个程序里面调节音量。如果还是没有声音，那就重启一下电脑，还是没有声音的话......重复上述步骤，多试试吧。

## 电源管理器（mate-power-manager）
```
$ sudo pacman -S mate-power-manager
```
可以用电源管理器来调节屏幕亮度，设置开机键功能和合盖后的电脑反应等。有的屏幕的亮度不能通过软件调节，那么调节屏幕亮度的功能就是废的。对于台式机来说，因为它没有电池和盖子，所以与这些硬件相关的功能也是直接没有提供的。



## 中文输入法（fcitx5）
```
$ sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-qt fcitx5-gtk
```
使用 vim 打开 **`~/.bash_profile`**，在最后添上：
```
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx
```
然后在 **`~/.xinitrc`** 当中的 `exec dwm` 的前面加上：
```
fcitx5 -d &
```
加上了这句，才会在启动X窗口时在后台运行 `fcitx5` 。  
打开 `fcitx5-configtool`，将 `Pinyin` 添加到输入法列表当中，可能需要去除仅显示当前语言的勾选项（Only Show Current Language）。然后还可以调整激活输入法、切换输入法的快捷方式等等。  
获取更多词库和颜色主题，词库会自动应用，但是颜色主题需要在 `fcitx5-configtool` 当中配置一下才会生效：
```
$ sudo pacman -S fcitx5-pinyin-zhwiki fcitx5-material-color fcitx5-nord
```

## PDF阅读器（Zathura）
支持 Vim 键位的 pdf 阅读器，还是挺不错的说。
```
$ sudo pacman -S zathura
```

## 安装paru
安装 `paru` 以后我们就可以在 AUR 里面下载软件了，意味着我们能够下载更多的软件了。添加完 archlinuxcn 源以后运行：
```
$ sudo pacman -S paru
```
可以通过 `paru --help` 查看 `paru` 的使用帮助，下面简单介绍几个它的常见用法：
- `paru` 刷新软件仓库缓存并更新整个系统；
- `paru <package name>` 在 AUR 上检索 package name 相关的软件包，可以在检索结果中选择特定的软件包进行安装，这在我们只知道软件包的部分名称，或计划安装某一族软件包的时候特别好用；
- `paru -S <package name>` 跳过检索过程，直接快进到安装软件；
- `paru -R <package name>` 删除某个已经安装好的软件包；
- `paru -Scc` 清空缓存、删除没有用的软件安装包。

## Edge浏览器
Edge 浏览器是我的主力浏览器，我可以在登陆以后自动填充各种网站的密码，所以即便前面已经下载了一个能够用来浏览网页的火狐浏览器，我依然需要下载一个 Edge 浏览器。
```
$ sudo pacman -S microsoft-edge-stable
```