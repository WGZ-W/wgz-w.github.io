
# Neovim

## Requirement of an Editor
## File Explorer Tree
## Auto Completation
## Language Server Protocol (LSP)
## Autopairs
## Preview??
## Tags


## Installation
## Lua language
If you don't know anything about Lua, I recommend taking some time to read through
a guide. One possible example which will only take 10-15 minutes:
- [Learn Lua in Y minutes](https://learnxinyminutes.com/docs/lua/).

After understanding a bit more about Lua, you can use `:help lua-guide` as a
reference for how Neovim integrates Lua.
- :help lua-guide
- [or HTML version](https://neovim.io/doc/user/lua-guide.html)

## Configuration
### Options
### Keymaps
### Plugins
#### nerd-font
```
ArchLinux:
$ sudo pacman -S ttf-jetbrains-mono-nerd

Mac:
$ brew install font-jetbrains-mono-nerd-font
```

#### gitsigns
#### which-key
#### Fuzzy Finder(files, lsp, etc)
- telescope.


#### colorscheme [everforest]

#### nvim-lspconfig

#### lazy.nvim
A modern plugin manager for Neovim.

#### nvim-cmp
A completion plugin for neovim coded in Lua.

#### mason.nvim
Portable package manager for Neovim that runs 
everywhere Neovim runs. Easily install and manage 
LSP servers, DAP servers, linters, and formatters.

#### nvim-lspconfig
Quickstart configs for Nvim LSP.

#### nvim-tree.lua
A file explorer tree for neovim written in lua.

#### nvim-treesitter
Nvim Treesitter configurations and abstraction layer.

#### lualine.nvim 
A blazing fast and easy to configure neovim statusline
plugin written in pure lua.

#### conform.nvim 
Lightweight yet powerful formatter plugin for Neovim 



---

title: "Vim Basic"
tag: vim
---

## 移动
## 查询和替换
```
# 将 \ 替换成 /
:%s/\\/\/
```

## 删除、复制、粘贴
## 可视块选择（Visual Block）
## 保存与离开
## 环境配置

## There 

**CTRL-]** jump around, **CTRL-O**, jump back, or `CTRL-T`.

`dd`
`J`

`i`, `a`, `o`, `O`(uppercase), 
`ZZ`,

You would like to see the context of the line with the cursor.  That's done with the **"zz"** command.


"u"(undo), CTRL-R(redo).

### Text objects
- aw "a word"
- as "a sentence"
- is "inner sentence"

Similarly, this guide assumes some familiarity with the basics of Nvim
(commands, options, mappings, autocommands), which are covered in the
user-manual.

[my config](https://github.com/WGZ-W/nvim)
```
$ git clone git@github.com:WGZ-W/nvim.git
```

## Clipboard
To make the system clipboard work with Neovim, you may need to install xclip (X11) or wl-clipboard (Wayland).
```
$ sudo pacman -S xclip
```








