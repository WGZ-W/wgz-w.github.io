# 简单安装Ubuntu

我自己安装 Ubuntu 进行的配置

- [简单安装Ubuntu](#简单安装ubuntu)
  - [分区：](#分区)
  - [先修改 root 密码](#先修改-root-密码)
  - [再修改安装包镜像源：](#再修改安装包镜像源)
  - [安装软件](#安装软件)
  - [实现 Git 和 GitHub 的 SSH 连接](#实现-git-和-github-的-ssh-连接)
## 分区：  

- EFI
- /boot
- /
- /usr
- /home
- /var

## 先修改 root 密码
```
$> sudo passwd
```
## 再修改安装包镜像源：  
- Software & Update

## 安装软件
- 安装 sogou
- 安装 Google Chrome
- 安装 Git、GCC 、G++
- 安装 Make、 vim

## 实现 Git 和 GitHub 的 SSH 连接
```
$> ssh-keygen -t rsa -C "email"
```




