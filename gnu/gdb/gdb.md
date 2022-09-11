# 简单的GDB使用

- [简单的GDB使用](#简单的gdb使用)
  - [开始调试](#开始调试)
  - [退出正在调试的函数](#退出正在调试的函数)
  - [打印](#打印)
    - [打印数组](#打印数组)
    - [打印源代码行](#打印源代码行)
  - [执行下一句](#执行下一句)
  - [设置断点](#设置断点)
  - [使用参数](#使用参数)
  - [显示调用栈](#显示调用栈)

## 开始调试
```
(gdb) start     从头开始调试 

(gdb) r         开始运行到第一个断点
```

## 退出正在调试的函数
```
(gdb) finish    函数继续执行完，打印返回值

(gdb) return    不继续执行，直接返回
(gdb) return exp    修改函数的返回值
```

## 打印
```
(gdb) p [value]     打印内置变量的值

(gdb) x/s str       打印字符串的值（str是字符串指针）
```

### 打印数组
```
(gdb) p array

(gdb) set print elements [number-of-elements]   设置打印的个数
(gdb) set print elements 0                      没有限制
(gdb) p array[index]@num           index 是数组索引（从0开始）， num 是连续多少个元素
(gdb) p *array@num                 表示从头开始打印连续的 num 个元素
(gdb) set print array-indexs on    打印索引下标
```

### 打印源代码行
```
(gdb) list -/+                  向上或者向下打印
(gdb) list main/function        打印指定函数
(gdb) list [number, number]     打印指定范围或者指定行数
```

## 执行下一句
```
(gdb) n     执行当前语句，函数调用不进入函数

(gdb) s     执行当前语句，若是调用函数则进入函数
```

## 设置断点
```
(gdb) b [line]      在 line 行设置断点

(gdb) i b           查看所有断点

(gdb) d [number]    删除编号为 number 的断点
```

## 使用参数
```
$>  gdb --args ./demo args1 args2
```

## 显示调用栈
```
(gdb) bt              显示函数调用栈
(gdb) frame           显示当前函数的栈
(gdb) bt full         显示所有栈中的局部变量的值
(gdb) bt full n       从内向外显示 n 个栈帧
(gdb) bt full -n      从外向内显示 n 个栈帧
(gdb) info locals     显示当前函数局部变量值
```


