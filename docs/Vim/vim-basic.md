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
