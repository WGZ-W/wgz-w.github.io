一些vim的基础用法
#

- [1. 查找并且替换](#搜索并且替换)  
- [2. 读入其他文件](#读入输入)  
- [3. 编辑多个文件](#编辑多个文件)  
- [4. 配置文件](#配置文件vimrc)
- [5. 自动补全](#自动补全)
- [6. 高级命令](#高级命令-for-programmers)
## 搜索并且替换
```
    :s/foo/bar    
    
    :s/foo/bar/g    匹配到的单词全部替换

    :s/foo/bar/gi   大小写敏感
    
    :4,8s/foo/bar/g
    
    :%s/foo/bar/g   整个文件
    
    :1,$s/foo/bar/g 整个文件
```

## 读入输入
```
    :r fname    读入文件

    :r !ls      读入命令的结果

    :r          读入当前文件
```

## 编辑多个文件
```
    :n      编辑下一个文件

    :rew    回到第一个文件

    :args   列出打开的文件，标记出正在使用的文件
```

## 配置文件[vimrc](./vimrc.html)
```
    set number

    set relativenumber  设置相对的行号（比较nb）

```

## 自动补全
```
- Ctrl-P	    向上文搜索
- Ctrl-N		向下文搜索
- Ctrl-X		选择搜索类型
  	- Ctrl-D	宏定义包括 include 文件
  	- Ctrl-I	当前文件和 include 文件
  	- Ctrl-F	查找文件名字，当前目录中
  	- Ctrl-L	复制当前文件中的一行
```
```  
 :set ignorecase		设置补全忽略大小写
 :set infercase		    推断补全的大小写，不只是匹配
 :set complete=.,d,i,w,u,b,t		设置补全的范围
 :set dictionary=file,file,...	    指定搜索目录
```


## 高级命令 for programmers
### 取消自动缩进
```
  Ctrl-D    取消一级缩进

  0Ctrl-D   取消所有级别缩进，光标返回第一列
            下一行光标也从第一列开始

  ^Ctrl-D   取消所有级别缩进，光标返回第一列
            下一行缩进级别不变 
```

### 插入缩进
```
  Ctrl-T    添加缩进，value = shiftwidth
  <Tab>     value = tabstop

  Ctrl-T 和 Ctrl-D 配合使用
```


### <Tab> 的使用
```
  set softtabstop=4     tab 移动4
  set tabstop=4         <Tab> 为4

  set shiftwidth=4
  set smarttab          行首<Tab>=4, 其他地方=8（目前不适用）

  set expandtab         使用 tab 变成插入一系列 spaces
                        不改变之前的 tab
  Ctrl-V<Tab>           在 expandtab is on 的时候，表示插入 tab
                        而不是 spaces
  
  :retab                 将之前的 tab 转化为 spaces
```

### Modelines
```
  /*vim:tabstop=8:expandtabs:shiftwidth=8*/
```
> 必须是这种结构，而且在第一行或者后五行中，vim自动生成这种
> 配置
  
#

