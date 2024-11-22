---
layout: post
tag: study
title: "Machine Learning"
---


# 机器学习  Machine Learning

- [机器学习  Machine Learning](#机器学习--machine-learning)
  - [*1* 引论  Introduction](#1-引论--introduction)
  - [*2* Pytorch](#2-pytorch)
    - [*2.1* Dataset and Dataloader](#21-dataset-and-dataloader)
    - [*2.2* Tensor](#22-tensor)
    - [*2.3* torch.nn](#23-torchnn)
  - [线性回归  Linear Regression](#线性回归--linear-regression)
  - [支持向量机  SVM](#支持向量机--svm)


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
