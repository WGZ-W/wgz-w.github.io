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
      - [范数 ???](#范数-)
    - [找出函数的三步骤](#找出函数的三步骤)
  - [*2*  Introduction 导论](#2--introduction-导论)
    - [Loss Function](#loss-function)
  - [*4* Multiple Layer Perceptron (多层感知机)](#4-multiple-layer-perceptron-多层感知机)
    - [隐藏层](#隐藏层)
    - [激活函数 (Activation Function)](#激活函数-activation-function)
    - [训练误差和泛化误差，](#训练误差和泛化误差)
      - [统计学习理论](#统计学习理论)
      - [模型复杂性](#模型复杂性)
      - [模型选择](#模型选择)
      - [欠拟合还是过拟合？](#欠拟合还是过拟合)
      - [多项式回归](#多项式回归)
    - [权重衰减](#权重衰减)
  - [Regression](#regression)
    - [Linear Regression （线性回归）](#linear-regression-线性回归)
    - [Softmax Regression (Softmax 回归)](#softmax-regression-softmax-回归)
  - [Classification](#classification)
  - [Conventional Neural Network (CNN)](#conventional-neural-network-cnn)
  - [Recurrent Neural Network (RNN)](#recurrent-neural-network-rnn)
  - [Attention](#attention)
    - [Self-Attention](#self-attention)
    - [Transformer](#transformer)
  - [*15* See Also](#15-see-also)

## *0* Mind Map
[Deep Learning](/mindmap/deep-learning.html)

## *1* 预备知识
### 线性代数
#### 范数 ???
向量的 L2 范数，向量的 L1 范数，
矩阵的 F 范数

### 找出函数的三步骤
设定范围，函数的集合，(Model),
Deep Learning (CNN, Transformer ...), Decision Tree , etc.

设定目标，评价函数的好坏，(Loss),
Supervised Learning , Semi-supervised Learning, RL, etc.

达成目标，找到最好的函数，最佳化 (Optimization),
Gradient Descent(Adam, AdamW...), Genetic Algorithm, etc.


## *2*  Introduction 导论

### Loss Function
Mean Absolute Error (MAE),
Mean Square Error (MSE)



## *4* Multiple Layer Perceptron (多层感知机)

### 隐藏层
### 激活函数 (Activation Function)
ReLU (Rectified linear unit),
Sigmoid,
tanh,

### 训练误差和泛化误差，

#### 统计学习理论
i.i.d. assumption (独立同分布假设)

#### 模型复杂性
early stopping (早停)

#### 模型选择
验证集，
K 折交叉验证，

#### 欠拟合还是过拟合？
模型复杂性，
数据集大小

#### 多项式回归

### 权重衰减
权重衰减，又称 L2 正则化。




## Regression
### Linear Regression （线性回归）
仿射变换，放缩和平移。
###  Softmax Regression (Softmax 回归)
softmax function, 
## Classification
二分类 (binary classification),
贝叶斯公式，
全概率公式，

## Conventional Neural Network (CNN)
卷积运算，互相关运算，
填充，步长，
池化（降低分辨率），

## Recurrent Neural Network (RNN)
## Attention
### Self-Attention
### Transformer








## *15* See Also
- [李宏毅 2023 春机器学习课程](https://speech.ee.ntu.edu.tw/~hylee/ml/2023-spring.php)
- [动手学深度学习](https://zh.d2l.ai/)
- [GitHub of Lhy_Machine_Learning ](https://github.com/Fafa-DL/Lhy_Machine_Learning)