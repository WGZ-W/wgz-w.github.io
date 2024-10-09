---
title: ArchLinux-Applications
author: wgz
data: 2024-09-22 12:00
tag: archlinux

---

# ArchLinux-3-Applications

**Index**
- [ArchLinux-3-Applications](#archlinux-3-applications)
  - [Ranger](#ranger)
  - [Tmux](#tmux)
  - [Lazygit](#lazygit)
  - [Tldr](#tldr)
  - [中文字体](#中文字体)
  - [中文输入法（fcitx5）](#中文输入法fcitx5)


## Ranger
```
$ sudo pacman -S ranger
```
## Tmux
```
$ sudo pacman -S tmux
```
## Lazygit
```
$ sudo pacman -S lazygit
```
## Tldr
```
$ sudo pacman -S tldr
```

## 中文字体
速速把所有能整上的免费字体都给整上
```
$ sudo pacman -S noto-fonts-cjk wqy-microhei wqy-microhei-lite wqy-bitmapfont
$ sudo pacman -S wqy-zenhei ttf-arphic-ukai ttf-arphic-uming adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
```

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
