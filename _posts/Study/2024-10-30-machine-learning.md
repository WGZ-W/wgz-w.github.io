---
layout: post
tag: study
title: "Deep Learning and Machine Learning"
---


# Deep Learning and Machine Learning

- [Deep Learning and Machine Learning](#deep-learning-and-machine-learning)
  - [Mind Map](#mind-map)
  - [*1* 预备知识](#1-预备知识)
  - [*2* 导论 Introduction](#2-导论-introduction)
    - [Three Stages](#three-stages)
    - [Activation function](#activation-function)
    - [Loss Function](#loss-function)
    - [ChatGPT Principle](#chatgpt-principle)
    - [Professional Words](#professional-words)
  - [回归 Regression](#回归-regression)
    - [线性模型 Linear model](#线性模型-linear-model)
    - [梯度下降 Gradient Descent](#梯度下降-gradient-descent)
    - [正则化 Regularization](#正则化-regularization)
  - [分类 Classification](#分类-classification)
  - [*3* 线性神经网络](#3-线性神经网络)
    - [线性回归 Linear Regression](#线性回归-linear-regression)
    - [Softmax 回归 Softmax Regression](#softmax-回归-softmax-regression)
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
  - [支持向量机  SVM](#支持向量机--svm)

## Mind Map
[Machine Learning Mind Map](/mindmap/machine-learning.html)

## *1* 预备知识
概率论，线性代数，高等数学，Pytorch，

## *2* 导论 Introduction
### Three Stages
1. Define a Function with unknown parameters
2. Loss Computation
3. Optimization

### Activation function
1. Sigmoid
2. ReLU

### Loss Function
1. 平均绝对值误差 Mean Absolute Error (MAE)
2. 平均平方误差 Mean Square Error (MSE)

### ChatGPT Principle
ChatGPT 原理，文字接龙（语言模型），probability distribution，sample (random).  

预训练，pre-train, self-supervised learning(自监督学习), Foundation model ，预训练作用：多语言习得，在一种语言上训练，其他语言自动学习。 

微调，Finetune，在 Foundation model 上继续学习.  

监督学习，Supervised Learning，成对的学习资料. 

强化学习, Reinforcement Learning (RL):  
It is challenging to label data in some tasks.We can know the results are good or not.
ChatGPT 的原理，就是文字接龙（语言模型），通过输入，输出一个机率分布（Probability distribution），然后随机 取样（sample）一个字，加到输入后面，然后再输入到模型中。

GPT 使用预训练（Pre-train）, 或者叫自监督学习（Self-supervised learning）, 生成的模型叫做基石模型（Foundation model）。
预训练作用：多语言习得，在一种语言上训练，其他语言自动学习。

微调（Finetune），在基石模型（Foundation model）上继续学习。

监督学习（Supervised Learning），就是提供成对的学习资料。  

强化学习（Reinforcement Learning (RL)）：
我们在某些任务上不知道如何标注数据，但是我们可以提供判断结果的好坏。（It is challenging to label data in some tasks. We can know the results are good or not.）


### Professional Words
- Machine Learning ~= Looking for Function  
- Deep Learning
- Neural Network
- Downstream tasks
- Generative Adversarial Network
- Anomaly Detection
- Explainable AI
- Model Attack
- Domain Adaptation
- Network Compression
- Life-long Learning
- Meta Learning = Learn to Learn
- Few-shot learning

## 回归 Regression
### 线性模型 Linear model
### 梯度下降 Gradient Descent
### 正则化 Regularization

## 分类 Classification
## *3* 线性神经网络
### 线性回归 Linear Regression
### Softmax 回归 Softmax Regression
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



## 支持向量机  SVM
