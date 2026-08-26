# Basic


## 计算机概论
### 
## 文件权限和目录配置
可以使用chown, chgrp, chmod
去修改这些权限与属性，

### 权限对于文件的重要性
- r (read)：读取文件内容；
- w (write)：写入，编辑，新增，修改；
- x (eXecute)：该文件具有可以被系统执行的权限。

在 Linux 上，文件是否能被执行， 是由【x】这个权限来决定的。  

至于 w 这个权限，可以具有写入、编辑、新增、修改文件的权限，
但并不具备删除该文件本身的权限。

### 权限对于目录的重要性
目录主要的内容在记录文件名清单。
- r (read contents in directory):
- w (modify contents of directory):
  表示具有该修改目录结构清单的权限：
  - 创建、删除、重命名、移动文件与目录
- x (access directory):
  目录的 【x】 代表的是使用者能否进入该目录成为工作目录。


## 正确的关机
查看目前在线上的人： 
```
$ who
```
而要看背景执行的程序可以使用：
```
ps -aux
```
重启：
```
$ sudo reboot
```

## 磁盘与目录容量
磁盘：df（disk free）
```
$ df -h
```
目录：
```
$ du -sh
```

## 命令行热键
- [Tab]，补全
- [Ctrl]-c，命令取消
- [Ctrl]-d，对话结束
- [shift]+{[PageUP]|[Page Down]}，翻页

## 后台任务
- bg? 
- fg, 
- ctrl-z, 
- jobs


