
# Tmux



## Installation
```
# Arch Linux
$ sudo pacman -S tmux

# Ubuntu
$ sudo apt install tmux
```

## Basics
### Attaching and detaching
- `C-b d`
```
$ tmux attach
or
$ tmux attach -tmysession

$ tmux ls
```

### Creating new windows
- `C-b c`


### Splitting the window
- `C-b %`
- `C-b "`

### Changing the current window
- `C-b 0`

### Choosing sessions, windows and panes
`C-b s`
`C-b w`

### Using the mouse
```
:set -g mouse on
```

## Configuring tmux
`.tmux.conf`


## See also
- [tmux wiki](https://github.com/tmux/tmux/wiki)
- [Arch wiki](https://wiki.archlinux.org/title/Tmux)
- [Tmux 使用教程](https://www.ruanyifeng.com/blog/2019/10/tmux.html)
- [powerline](https://github.com/Lokaltog/powerline), a dynamic statusbar for tmux
- [Practical Tmux](https://mutelight.org/practical-tmux)
