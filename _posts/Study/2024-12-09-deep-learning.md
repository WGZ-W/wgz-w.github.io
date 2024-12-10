---
layout: post
tag: study
title: "Deep Learning"
---

# Deep Learning

- [Deep Learning](#deep-learning)
  - [*0* Mind Map](#0-mind-map)
  - [*1* 预备知识](#1-预备知识)
    - [线性代数](#线性代数)
      - [范数](#范数)
    - [自动微分](#自动微分)
  - [*2* 导论 Introduction](#2-导论-introduction)
    - [Three Stages](#three-stages)
    - [General Loss Function](#general-loss-function)
  - [*3* 线性神经网络](#3-线性神经网络)
    - [线性回归 (Linear Regression)](#线性回归-linear-regression)
    - [Softmax 回归 (Softmax Regression)](#softmax-回归-softmax-regression)
  - [*4* 多层感知机 (Multiple Layer Perceptron)](#4-多层感知机-multiple-layer-perceptron)
    - [多层感知机](#多层感知机)
      - [隐藏层](#隐藏层)
      - [激活函数 (Activation Function)](#激活函数-activation-function)
    - [模型选择、欠拟合、过拟合](#模型选择欠拟合过拟合)
      - [训练误差和泛化误差，](#训练误差和泛化误差)
        - [统计学习理论](#统计学习理论)
        - [模型复杂性](#模型复杂性)
      - [模型选择](#模型选择)
      - [欠拟合还是过拟合？](#欠拟合还是过拟合)
      - [多项式回归](#多项式回归)
    - [权重衰减](#权重衰减)
  - [*5* 深度学习计算](#5-深度学习计算)
  - [*6* 卷积神经网络](#6-卷积神经网络)
  - [*7* 现代卷积神经网络](#7-现代卷积神经网络)
  - [*8* 循环神经网络](#8-循环神经网络)
  - [*9* 现代循环神经网络](#9-现代循环神经网络)
  - [*10* 注意力机制](#10-注意力机制)
    - [*10.1* Self-Attention](#101-self-attention)
    - [*10.2* Transformer](#102-transformer)
  - [*11* 优化算法](#11-优化算法)
  - [*12* 计算性能](#12-计算性能)
  - [*13* 计算机视觉](#13-计算机视觉)
  - [*14* 自然语言处理](#14-自然语言处理)
  - [*15* See Also](#15-see-also)

## *0* Mind Map
[Deep Learning](/mindmap/deep-learning.html)

## *1* 预备知识
概率论，线性代数，高等数学，Pytorch，


### 线性代数
#### 范数
向量的 L2 范数，欧几里得距离，向量元素平方和的平方根。

### 自动微分

## *2* 导论 Introduction
### Three Stages
1. Define a Function with unknown parameters
2. Loss Computation
3. Optimization

### General Loss Function
1. 平均绝对值误差 Mean Absolute Error (MAE)
2. 平均平方误差 Mean Square Error (MSE)


## *3* 线性神经网络
### 线性回归 (Linear Regression)
- 仿射变换

### Softmax 回归 (Softmax Regression)
- softmax 函数


## *4* 多层感知机 (Multiple Layer Perceptron)

### 多层感知机
#### 隐藏层
#### 激活函数 (Activation Function)
- ReLU (Rectified linear unit)
- Sigmoid
- tanh

### 模型选择、欠拟合、过拟合
#### 训练误差和泛化误差，

##### 统计学习理论
独立同分布假设 (i.i.d. assumption)

##### 模型复杂性
早停 (early stopping)

#### 模型选择
1. 验证集
2. K 折交叉验证

#### 欠拟合还是过拟合？
1. 模型复杂性
2. 数据集大小

#### 多项式回归

### 权重衰减
权重衰减，又称 L2 正则化。

## *5* 深度学习计算
## *6* 卷积神经网络
## *7* 现代卷积神经网络
## *8* 循环神经网络
## *9* 现代循环神经网络
## *10* 注意力机制
### *10.1* Self-Attention
### *10.2* Transformer
## *11* 优化算法
## *12* 计算性能
## *13* 计算机视觉
## *14* 自然语言处理

## *15* See Also
- [李宏毅 2023 春机器学习课程](https://speech.ee.ntu.edu.tw/~hylee/ml/2023-spring.php)
- [动手学深度学习](https://zh.d2l.ai/)
- [GitHub of Lhy_Machine_Learning ](https://github.com/Fafa-DL/Lhy_Machine_Learning)