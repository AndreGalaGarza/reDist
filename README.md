# reDist
## Overview
This package reimplements the base R function [dist()](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/dist).

When given a data matrix as input, ``re_dist()`` calculates the distance between each pair of rows in the input matrix using the specified distance metric. The result is stored as a special single-dimensional vector object that resembles a lower triangular matrix.

## Arguments
- ``x`` - A numeric matrix, data frame, or ``dist`` object.
- ``method`` - The distance measure to use for calculating the distance between rows. This must be one of the following: ``euclidean``, ``maximum``, ``manhattan``, ``canberra``, ``binary``, or ``minkowski``.
- ``diag`` - Default value = FALSE. Set to TRUE to print the diagonal of the distance matrix.
- ``upper`` - Default value = FALSE. Set to TRUE to print the upper triangular part of the distance matrix.
- ``p`` - The power of the Minkowski distance. This is only relevant if the chosen ``method`` = ``minkowski``.

## Installation
```
install.packages("reDist")
```

## Usage
```
library(reDist)

re_dist(mat, method = "euclidean")
##           a         b         c
## b  8.246211                    
## c  1.414214  9.055385          
## d 10.770330  6.633250 10.862780

re_dist(mat, method = "maximum")
##   a b c
## b 5    
## c 1 5  
## d 7 6 7

re_dist(mat, method = "manhattan")
##    a  b  c
## b 16      
## c  2 18   
## d 20 10 20

re_dist(mat, method = "canberra")
##           a         b         c
## b 2.2031746                    
## c 0.3111111 2.4365079          
## d 3.0141414 1.2678571 3.0808081

re_dist(mat, method = "binary")
##      a    b    c
## b 0.00          
## c 0.00 0.00     
## d 0.25 0.25 0.25

re_dist(mat, method = "minkowski")
##           a         b         c
## b  8.246211                    
## c  1.414214  9.055385          
## d 10.770330  6.633250 10.862780

re_dist(mat, method = "euclidean", diag = TRUE, upper = TRUE)
##           a         b         c         d
## a  0.000000  8.246211  1.414214 10.770330
## b  8.246211  0.000000  9.055385  6.633250
## c  1.414214  9.055385  0.000000 10.862780
## d 10.770330  6.633250 10.862780  0.000000        
```