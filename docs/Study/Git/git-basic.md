---
date:
    created: 2024-10-09
title: 'Git Basic'
tag: git
---

## 配置Git
Git跟踪谁修改了项目，所以需要提供用户名和邮箱，用户名必须提供，邮箱可以虚构：
```
$ git config --global user.name "username"
$ git config --global user.email "useremail"
```
设置每个项目中主分支的默认名称，不错的主分支名字是 main：
```
$ git config --global init.defaultBranch main
```

## 放弃修改
放弃最后一次提交之后对文件所做的所有修改：
```
$ git restore .
```

## 检出以前的提交
检出提交历史的任何提交，使用 checkout，并指定该提交的引用 ID 的前 6 个字符：
```
$ git checkout ID[:6]
```

放弃最近的工作选择以前的提交：
```
$ git reset --hard ID[:6]
```

## 删除仓库
```
$ rm -rf .git/
$ del .git (Windows)
```


## gitignore
要停止跟踪当前已被跟踪的文件，可使用 
```
git rm --cached
```
从索引中移除该文件。文件名随后要被添加到 `.gitignore` 文件中，以防止该文件在以后的提交中被重新引入。





### How to Clone a Specific Branch
```
$ git clone --branch <branchname> <remote-repo-url>
```

