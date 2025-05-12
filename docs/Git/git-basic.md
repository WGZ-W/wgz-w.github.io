---
date:
    created: 2024-10-09
title: 'Git Basic'
tag: git
---


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

