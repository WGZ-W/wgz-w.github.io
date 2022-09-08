---
   title: VIM
   date: 2022-09-05 12:29:40
   tags:
---

一些vim的基础用法

<!-- more -->

- [1. 查找并且替换](#search-and-replace)  
- [2. 读入其他文件](#reading-input)  
- [3. 编辑多个文件](#multiple-files)  
- [4. 设置参数](#setting-optionsvimrc)
- [5. 自动补全](#automatic-completion)

## Search and replace
```
    :s/foo/bar    
    
    :s/foo/bar/g    匹配到的单词全部替换

    :s/foo/bar/gi   大小写敏感
    
    :4,8s/foo/bar/g
    
    :%s/foo/bar/g   整个文件
    
    :1,$s/foo/bar/g 整个文件
```

## Reading input
```
    :r fname    读入文件

    :r !ls      读入命令的结果

    :r          读入当前文件
```

## Multiple files
```
    :n      编辑下一个文件

    :rew    回到第一个文件

    :args   列出打开的文件，标记出正在使用的文件
```

## Setting options(.vimrc)
```
    set number

    set relativenumber  设置相对的行号（比较nb）

    
```

## Automatic Completion
```
- Ctrl-P           向上找
- Ctrl-N           向下找
- Ctrl-X           进入选择模式
    - Ctrl-D       选择宏定义
    - Ctrl-F       选择当前目录中的文件
    - Ctrl-L       复制一行 
    - Ctrl-I       选择 include 文件里的
```

```
  :set infercase
  :set complete
  :set ignorecase
  :set dictionary=
```
