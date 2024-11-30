---
layout: post
tag: study
title: "Machine Learning & Deep Learning"
---


# Machine Learning & Deep Learning

- [Machine Learning \& Deep Learning](#machine-learning--deep-learning)
  - [Mind Map](#mind-map)
  - [*1* 前言 Introduction](#1-前言-introduction)
    - [ChatGPT 原理](#chatgpt-原理)
      - [预训练](#预训练)
      - [微调](#微调)
      - [监督学习](#监督学习)
      - [强化学习](#强化学习)
    - [*1.2* ChatGPT 原理](#12-chatgpt-原理)
      - [1.2.1 预训练](#121-预训练)
      - [1.2.2 微调 finetune](#122-微调-finetune)
      - [1.2.3 监督学习](#123-监督学习)
      - [1.2.4 强化学习](#124-强化学习)
  - [*2* 预备知识](#2-预备知识)
  - [*3* 线性神经网络](#3-线性神经网络)
  - [*4* 多层感知机](#4-多层感知机)
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
  - [*2* Pytorch](#2-pytorch)
    - [*2.1* Dataset and Dataloader](#21-dataset-and-dataloader)
    - [*2.2* Tensor](#22-tensor)
    - [*2.3* torch.nn](#23-torchnn)
  - [线性回归  Linear Regression](#线性回归--linear-regression)
  - [支持向量机  SVM](#支持向量机--svm)

## Mind Map
[Machine Learning Mind Map](/mindmap/machine-learning.html)

## *1* 前言 Introduction
1. Three Stages
   1. Define a Function with unknown parameters
   2. Loss compute
   3. Optimization
2. gradient descent
3. activation function
   1. sigmoid
   2. ReLU
4. loss function
   1. mean absolute error (MAE)
   2. mean square error (MSE)
### ChatGPT 原理
#### 预训练
- pre-train, self-supervised learning, Foundation model  
- 预训练作用：多语言习得，在一种语言上训练，其他语言自动学习

#### 微调
- Finetune，
- 在 Foundation model 上继续学习

#### 监督学习
- supervised learning，
- 成对的学习资料

#### 强化学习
- reinforcement learning， 
- 不知道标签，只需要判断好坏
### *1.2* ChatGPT 原理
- 文字接龙（语言模型）
- probability distribution
- sample (random)

#### 1.2.1 预训练
- pre-train
- self-supervised learning (自监督学习)
- Foundation model 

预训练作用：多语言习得，在一种语言上训练，其他语言自动学习。

#### 1.2.2 微调 finetune 
- （继续学习）
#### 1.2.3 监督学习
- 成对资料
- data-label

#### 1.2.4 强化学习
不知道标签，只需要判断好坏。




Machine Learning ~= Looking for Function  
Professional words:
- Deep Learning
- Neural Network
- regression
- classification
- generative
- Supervised Learning
- Self-supervised Learning
- Pre-train
- Downstream tasks
- Fine-tune
- Foundation Model (Pre-trained Model)
- Generative Adversarial Network
- Reinforcement Learning (RL)
  -  It is challenging to label data in some tasks.
  -  We can know the results are good or not.
- Anomaly Detection
- Explainable AI
- Model Attack
- Domain Adaptation
- Network Compression
- Life-long Learning
- Meta Learning = Learn to Learn
- Few-shot learning

## *2* 预备知识
## *3* 线性神经网络
## *4* 多层感知机
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


 



## *2* Pytorch
### *2.1* Dataset and Dataloader
### *2.2* Tensor
- Shape of tensors
- Creating tensors
- Common Operations
  - Transpose
  - Squeeze
  - Unsqueeze
  - Cat
- Device
  - torch.cuda.is_available()
  - to('cuda')
- Gradient Calculation

### *2.3* torch.nn 
- Network Layers
- Network Parameters
- Non-Linear Activation Functions
- Build your own neural network
- Loss Functions

## 线性回归  Linear Regression
## 支持向量机  SVM
