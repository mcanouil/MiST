
<!-- README.md is generated from README.Rmd. Please edit that file -->

# *Mi*xed effects *S*core *T*est <img src="man/figures/mistr.png" align="right" width="120" />

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![GitHub
tag](https://img.shields.io/github/tag/mcanouil/MiSTr.svg?label=latest%20tag)](https://github.com/mcanouil/MiSTr)
[![Codecov test
coverage](https://codecov.io/gh/mcanouil/MiSTr/branch/main/graph/badge.svg)](https://codecov.io/gh/mcanouil/MiSTr?branch=main)
[![R-CMD-check](https://github.com/mcanouil/MiSTr/workflows/R-CMD-check/badge.svg)](https://github.com/mcanouil/MiSTr/actions)
<!-- badges: end -->

Test for association between a set of SNPS/genes and continuous or
binary outcomes by including variant characteristic information and
using (weighted) score statistics.

**Note:**

-   From: <https://cran.r-project.org/src/contrib/MiST_1.0.tar.gz>
-   Reference: <https://doi.org/10.1002/gepi.21717>

## Installation

``` r
# Install MiSTr from CRAN:
install.packages("MiSTr")

# Or the the development version from GitHub:
# install.packages("remotes")
remotes::install_github("mcanouil/MiSTr")
```

## MiSTr in Action

``` r
library(MiSTr)
data(mist_data)
attach(mist_data)
#> The following objects are masked from mist_data (pos = 3):
#> 
#>     genotypes, phenotypes, variants_info
```

### Continuous Outcome

``` r
res <- mist(
  y = phenotypes[, "y_taupi"],
  X = phenotypes[, paste0("x_cov", 0:2)],
  G = genotypes,
  Z = variants_info[, 1, drop = FALSE]
)
#> [MiSTr] "y" seems to be "continuous", model is set to "continuous"!
#> [MiSTr] Linear regression is ongoing ...
str(res)
#> List of 2
#>  $ estimate  :'data.frame':  1 obs. of  8 variables:
#>   ..$ SubClusters     : chr "1"
#>   ..$ term.pi.hat     : chr "Mcluster1"
#>   ..$ estimate.pi.hat : num 0.248
#>   ..$ std.error.pi.hat: num 0.321
#>   ..$ statistic.pi.hat: num 0.774
#>   ..$ p.value.pi.hat  : num 0.441
#>   ..$ conf.low.pi.hat : num -0.389
#>   ..$ conf.high.pi.hat: num 0.885
#>  $ statistics:'data.frame':  1 obs. of  5 variables:
#>   ..$ S.pi           : num 0.601
#>   ..$ p.value.S.pi   : num 0.438
#>   ..$ S.tau          : num 1006
#>   ..$ p.value.S.tau  : num 0.0111
#>   ..$ p.value.overall: num 0.0307
#>  - attr(*, "class")= chr "mist"
print(res)
#> 
#> MiSTr: Mixed effects Score Test
#> -------------------------------
#> 
#> - (Raw) Estimates:
#> 
#>   SubClusters term.pi.hat estimate.pi.hat std.error.pi.hat statistic.pi.hat p.value.pi.hat conf.low.pi.hat conf.high.pi.hat
#> 1           1   Mcluster1           0.248            0.321            0.774          0.441          -0.389            0.885
#> 
#> - Statistics:
#> 
#>   + Overall effect: 
#>     * P-value = 0.0307
#>   + PI (mean effect):  
#>     * Score = 0.601
#>     * P-value = 0.438
#>   + TAU (heterogeneous effect):  
#>     * Score = 1006.125
#>     * P-value = 0.0111
```

### Binary Outcome

``` r
res <- mist(
  y = phenotypes[, "y_binary"],
  X = phenotypes[, paste0("x_cov", 0:2)],
  G = genotypes,
  Z = variants_info[, 1, drop = FALSE]
)
#> [MiSTr] "y" seems to be "binary", model is set to "binary"!
#> [MiSTr] Logistic regression is ongoing ...
str(res)
#> List of 2
#>  $ estimate  :'data.frame':  1 obs. of  8 variables:
#>   ..$ SubClusters     : chr "1"
#>   ..$ term.pi.hat     : chr "GZ"
#>   ..$ estimate.pi.hat : num 3.58
#>   ..$ std.error.pi.hat: num 0.344
#>   ..$ statistic.pi.hat: num 3.7
#>   ..$ p.value.pi.hat  : num 0.000216
#>   ..$ conf.low.pi.hat : num 1.94
#>   ..$ conf.high.pi.hat: num 7.53
#>  $ statistics:'data.frame':  1 obs. of  5 variables:
#>   ..$ S.pi           : num 17.5
#>   ..$ p.value.S.pi   : num 2.83e-05
#>   ..$ S.tau          : num 5.4
#>   ..$ p.value.S.tau  : num 0.175
#>   ..$ p.value.overall: num 6.54e-05
#>  - attr(*, "class")= chr "mist"
print(res)
#> 
#> MiSTr: Mixed effects Score Test
#> -------------------------------
#> 
#> - (Raw) Estimates:
#> 
#>   SubClusters term.pi.hat estimate.pi.hat std.error.pi.hat statistic.pi.hat p.value.pi.hat conf.low.pi.hat conf.high.pi.hat
#> 1           1          GZ           3.576            0.344              3.7              0           1.935            7.528
#> 
#> - Statistics:
#> 
#>   + Overall effect: 
#>     * P-value = 6.54e-05
#>   + PI (mean effect):  
#>     * Score = 17.527
#>     * P-value = 2.83e-05
#>   + TAU (heterogeneous effect):  
#>     * Score = 5.4
#>     * P-value = 0.175
```
