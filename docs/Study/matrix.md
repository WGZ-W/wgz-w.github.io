---
layout: post
tag: study
title: "Matrix Analysis and Application"
---

# Matrix Analysis and Application




## *1* Linear Equations(线性方程组)

- **Gaussian Elimination (高斯消去法)**：就是用以上三种操作，选择主元，消去主元所在列以下的元素，直到变为行阶梯型。  
- **Gauss-Jordan Method (高斯约当法)**：将主元所在列以上的部分也变为零。  
- **Partial Pivoting (部分主元法)**：每次将当前基本列中最大元素所在方程与原主元所在方程交换位置，再用高斯消去法。  
- **Complete Pivoting (全部主元法)**：将当前主元所在子矩阵中最大元素作为本次步骤的主元，也就是除了可以交换行，也可以交换列。交换列时需同时交换未知数。


## *2* Matrix Algebra(矩阵代数)
For matrices Amn and Bnm, trace(AB) = trace(BA).  
trace(ABC) = trace(BCA) = trace(CAB).  
trace(ABC) = trace(BCA)
> trace(AB) = trace(BA)

**Sherman-Morrison Formula**:

### *2.1* LU Factorization (LU 分解)
- A = LU
- PA = LU, ***系数相反数***
- Existence of LU Factors


## *3* Vector Spaces (向量空间)
### *3.1* Vector Spaces and Subspaces
#### *3.1.1* Vector Space (向量空间)
#### *3.1.2* Subspaces (子空间)
- closure property for vector addition
- closure property for scalar multiplication

### *3.2* Four Fundamental Subspaces (四个基本子空间)
#### *3.2.1* Range Spaces (值域空间)
#### *3.2.2* Nullspace (零空间)

### *3.3* Linear Independence (线性独立)
### *3.4* Basis and Dimension


## *4* Linear Transformations(线性变换)
### *4.1* Introduction
- Linear operator (线性算子)

### *4.2* Invariant Subspaces(不变子空间)


## *5* Norms and Inner Products (模和内积)
### *5.1* Vector Norms
### *5.2* Matrix Norms
- Frobenius-norm, 
- 1-norm, the largest absolute column sum
- 2-norm
- ∞-norm, the largest absolute row sum 

### *5.3* Orthogonal Vectors (正交向量)
- Orthonormal Sets (标准正交基)
- Fourier Expansions (傅里叶展开)

### *5.4* Gram-Schmidt Procedure (施密特)
- Gram-Schmidt Procedure (施密特)
- Modified Gram-Schmidt Algorithm (施密特)

### *5.5* Unitary and Orthogonal Matrices (酉矩阵)

### *5.6* Householder reduction
### *5.7* Given reduction
### *5.8* Core-Nilpotent Decomposition


## *6* Determinants
## *7* Eigenvalues and Eigenvectors





## *8* See Also
- [2022](https://blog.csdn.net/CongeeONE/article/details/128173796)
- [notes](https://www.cnblogs.com/izcat/p/15560010.html)
- [2023](https://blog.csdn.net/Mario__SZ/article/details/134547781)
- [homeworks](https://blog.csdn.net/qq_42455246/article/details/128607832)
- [2021](https://blog.csdn.net/qq_42251120/article/details/121332227)
