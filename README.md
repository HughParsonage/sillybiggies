# sillybiggies

<!-- badges: start -->
<!-- badges: end -->

The goal of sillybiggies is to perform arithmetic very large integers without a loss of precision.
It achieves this in a silly way: each digit is allocated to an integer vector and arithmetic
is performed in the schoolboy way. (i.e. carrying the ten for addition)

## Installation

You can install sillybiggies using devtools:

```r
# install.packages("devtools")
devtools::install_github("hughparsonage/sillybiggies")
```

## Example

This is a basic example:

``` r
library(sillybiggies)
add_int(555, 555)
```

Because of the R parser, you can just enter large numbers directly as they will 
be intercepted with a loss of precision immediately. You can either enter them 
as strings 

```r
add_int("235972350923095820938523095", "2039529035709235905231")
```

or by separating any digits with pipes

```r
add_int(235972350923|095820938523095, 20395290|35709235|905231)
```
