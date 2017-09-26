# Factorizorizing Polynomials over Finite Fields 

### Details:

**Written by:** emcd123

**For:** Summer Internship Programme with the *College of mathematics* at NUIG(*National University of Ireland Galway*)

## Project Description: 

The aim of this project is to study algorithms for *factorization of polynomials  
over finite fields*. Such factorizations are interesting in applications of  
finite fields, e.g. *coding theory* and *cryptography*, as well as being the key  
ingredient in factorizations over other coefficients.  

In particular two algorithms will be studied:  

1. **Berlekamp's algorithm**. This is a *deterministic algorithm* constructed by  
Elwyn Berlekamp in 1967. Until the Cantor-Zassenhaus algorithm (see below)  
appeared, this was the main algorithm used.  

2. The **Cantor-Zassenhaus algorithm**. This is an algorithm with a lower  
computational complexity that was introduced in 1981. In contrast to  
Berlekamp's algorithm, it is a *probabilistic algorithm*.  


## Contents: 

#### Source code files for project
FinalBerlekamp.sagews
CantorZassenhaus.sagews

#### Discarded Folder: 

Contains failed or incomplete attempts at implementing these algorithms

#### Other Files: 

Are simply me attempting to use SageMath 


## Running the project

Written using SageMath  
Can be installed from http://doc.sagemath.org/html/en/installation/  
Or run in the CoCalc(SageMath cloud service) https://cocalc.com/

## Usage

Define the *specified polynomial* in the correct variable(*U*) in either algorithms file  
Polynomial should be entered in the form **_a^(n) + b^(n-1) + ... + constant_**

## Resources Used

*The Art Of Programming* by Donald E. Knuth


