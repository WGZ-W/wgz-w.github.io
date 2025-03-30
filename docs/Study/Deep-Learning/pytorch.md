---

tag: study
title: "Pytorch Tutorial"
---

# Pytorch


## Quickstart
- nn.CrossEntropy ???
- argmax ???

## *1* Tensor
### *1.1* Initialization
- From data
- From_numpy
- From other tensor
- With random or constant values

### *1.2* Attributes
- shape
- dtype
- device

### *1.3* Operation
#### *1.3.1* Basic
- to('cuda') (torch.cuda.is_available())
- index and slice
- cat
- tensor.T (Transpose)
- Squeeze ???
- Unsqueeze ???

#### *1.3.2* Arithmetic operations
- @, matmul (matrix multiplication)
- *, mul (element-wise product)

#### *1.3.3* Single-element tensors
- item()

#### *1.3.4* In-place operations
- add_()

#### *1.3.5* Bridge with Numpy
Tensors on the CPU and NumPy arrays can share their underlying memory locations, and changing one will change the other.

## Dataset and Dataloader
## Auto Gradient
## Basics
- Dataset and DataLoaders
- Transforms
- Model
- Optimization
- Save and Load Model





### *2.3* torch.nn 
- Network Layers
- Network Parameters
- Non-Linear Activation Functions
- Build your own neural network
- Loss Functions
