# Vim 快速注释
在 Vim 中快速注释代码有几种高效方法，以下是常用技巧总结：

## 原生 Vim 方法（无需插件）

### 单行注释
- I# Esc：在普通模式下按 I，输入注释符（如 #），按 Esc 完成（适用于 Python/Shell）

- gI// Esc：在行首插入 //（适用于 C++/Java）

### 多行注释 (Visual Block 模式)
1. 移动光标到起始行
2. Ctrl+V 进入块选择模式
3. 用方向键选择多行
4. Shift+I 进入插入模式
5. 输入注释符（如 // 或 #）
6. 按 Esc（延迟生效，所有选中行首插入注释符）

### 取消多行注释
1. Ctrl+V 块选择注释符所在列
2. 按 d 删除注释符

## 自定义快捷键（添加到 ~/.vimrc）
```
" 注释当前行（支持不同文件类型）
noremap <leader>c :s/^/\=comment_prefix/<CR>
" 取消注释
noremap <leader>u :s/^\=comment_prefix//<CR>

" 定义文件类型注释符（需提前设置）
autocmd FileType c,cpp,java let comment_prefix = '//'
autocmd FileType python,sh,ruby let comment_prefix = '#'
autocmd FileType vim let comment_prefix = '"'
```

## 使用插件（推荐高效方案）

安装 https://github.com/tpope/vim-commentary

" 使用 Vim-Plug 安装
Plug 'tpope/vim-commentary'

使用方式：
gcc：注释/取消注释当前行

gc + 移动命令（如 gcap 注释段落）

选中文本后 gc 注释选区

gcgc：取消注释当前段落

行尾注释添加

" 添加行尾注释（// 为例）

" 使用：普通模式按 \C（反斜杠+C）

不同语言注释符参考
语言        注释符 语言 注释符

Python # Vim "
C/C++/Java // HTML/XML <!-- -->
SQL -- CSS/SCSS / /

选择最适合你的方式，插件方案（vim-commentary）在跨语言场景下最便捷高效！