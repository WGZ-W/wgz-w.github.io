---
layout: post
title: Ranger
tag: tools
---

# Ranger

- [Ranger](#ranger)
  - [1 Installation](#1-installation)
  - [2 Usage](#2-usage)
    - [Change the default editor to Neovim](#change-the-default-editor-to-neovim)
    - [Key bindings and hints](#key-bindings-and-hints)
    - [Working with Files](#working-with-files)
    - [Tabbed Browsing](#tabbed-browsing)
    - [Command Interface](#command-interface)
    - [Using shell](#using-shell)
  - [3 Configuration](#3-configuration)
  - [4 Tips and tricks](#4-tips-and-tricks)
    - [4.1 Hidden files](#41-hidden-files)
    - [4.2 Shell tips](#42-shell-tips)
      - [4.2.1 Preventing nested ranger instances](#421-preventing-nested-ranger-instances)
  - [See also](#see-also)

## 1 Installation
```
$ sudo pacman -S ranger
```
## 2 Usage
### Change the default editor to Neovim
```
~/.bashrc
------------------
export EDITOR=nvim
```


### Key bindings and hints
- `s` for :shell command  
- `!` for :shell command  
- `r` for :open_with command  
- `y` for yank(copy)  
- `d` for cut/delete  
- `p` for paste  
- `z` for changing settings  
- `u` for "undo"  
- `S` for open a shell at current directory
- `[` for move at parent directory
- `]` for move at parent directory

### Working with Files
- i = Display file (useful if you'd like to view a text file in a pager instead of editing it)
- r = Open file with… (allows you to choose program to use)
- zh = View hidden files
- [space] = Select current file
- cw = Rename current file
- yy = Yank (copy) file
- dd = Mark file for cut operation

### Tabbed Browsing
- [ctrl]-n = Create new tab
- [ctrl]-w = Close current tab
- [tab] = Next tab
- [shift][tab] = Previous tab

### Command Interface
- ! = Execute a command from the shell (non-ranger commands)
- : = Execute a ranger command


### Using shell
Ranger allows you to use shell. Just type your shell command in ranger's console after `:shell` and press `Enter` to run it.
- `s` for :shell command  
- `!` for :shell command


## 3 Configuration
```
$ ranger --copy-config=all
```

## 4 Tips and tricks  
### 4.1 Hidden files
To make this permanent, add the setting to your configuration file:
```
rc.conf
--------------------
set show_hidden true
```
Alternatively, hidden files can be toggled by pressing **`zh`**.

### 4.2 Shell tips
#### 4.2.1 Preventing nested ranger instances
You can start a shell in the current directory with **`S`**, when you exit the shell you get back to your ranger instance.  
When you however forget that you already are in a ranger shell and start ranger again you end up with ranger running a shell running ranger.
To prevent this you can create the following function in your **`shell's startup file`**:
```
~/.bashrc at ArchLinux
-----------------------------------
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    else
        exit
    fi
}


~/.zshrc at Mac and Homebrew
-------------------------------------
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /opt/homebrew/bin/ranger "$@"
    else
        exit
    fi
}
```

## See also
- [Arch wiki](https://wiki.archlinux.org/title/Ranger)
- [Github](https://github.com/ranger/ranger/wiki)
- [Official User Guide](https://github.com/ranger/ranger/wiki/Official-user-guide)
