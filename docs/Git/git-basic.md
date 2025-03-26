---
date:
    created: 2024-10-09
title: 'Git Basic'
tag: git
---


## Stop tracking a file that is currently tracked.
```
git rm --cached
```
Use this option to unstage and remove paths only from the index. Working tree files, whether modified or not, will be left alone.

gitignore - Specifies intentionally untracked files to ignore.Files already tracked by Git are not affected.
To stop tracking a file that is currently tracked, use **`git rm --cached`** to remove the file from the index. The filename can then be added to the **`.gitignore`** file to stop the file from being reintroduced in later commits.

### How to Clone a Specific Branch
```
$ git clone --branch <branchname> <remote-repo-url>
```

