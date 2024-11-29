---
layout: post
tag: study
title: "Machine Learning"
---


# 机器学习  Machine Learning

- [机器学习  Machine Learning](#机器学习--machine-learning)
  - [Mind Map](#mind-map)
  - [*1* 引论  Introduction](#1-引论--introduction)
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
  - [*2* Pytorch](#2-pytorch)
    - [*2.1* Dataset and Dataloader](#21-dataset-and-dataloader)
    - [*2.2* Tensor](#22-tensor)
    - [*2.3* torch.nn](#23-torchnn)
  - [线性回归  Linear Regression](#线性回归--linear-regression)
  - [支持向量机  SVM](#支持向量机--svm)

## Mind Map
[Machine Learning Mind Map](../../mindmap/machine-learning.html)

## *1* 引论  Introduction

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
