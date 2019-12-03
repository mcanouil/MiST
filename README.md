
<!-- README.md is generated from README.Rmd. Please edit that file -->

# *Mi*xed effects *S*core *T*est

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![GitHub
tag](https://img.shields.io/github/tag/mcanouil/MiST.svg?label=latest%20tag)](https://github.com/mcanouil/MiST)
[![Travis-CI Build
Status](https://travis-ci.org/mcanouil/MiST.svg?branch=master)](https://travis-ci.org/mcanouil/MiST)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/mcanouil/MiST?branch=master&svg=true)](https://ci.appveyor.com/project/mcanouil/MiST)
[![Coverage Status
(codecov)](https://codecov.io/gh/mcanouil/MiST/branch/master/graph/badge.svg)](https://codecov.io/gh/mcanouil/MiST)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version-ago/MiST)](https://cran.r-project.org/package=MiST)
[![cran
checks\_worst](https://cranchecks.info/badges/worst/MiST)](https://cran.r-project.org/web/checks/check_results_MiST.html)
[![CRAN\_Download\_total](https://cranlogs.r-pkg.org/badges/MiST)](https://cran.r-project.org/package=MiST)
<!--[![cran checks_summary](https://cranchecks.info/badges/summary/MiST)](https://cran.r-project.org/web/checks/check_results_MiST.html)-->
<!--[![CRAN_Download_month](https://cranlogs.r-pkg.org/badges/MiST?color=brightgreen)](https://cran.r-project.org/package=MiST)-->
<!--[![Coverage Status (coveralls)](https://coveralls.io/repos/github/mcanouil/MiST/badge.svg?branch=master)](https://coveralls.io/github/mcanouil/MiST?branch=master)-->
<!-- badges: end -->

Test for association between a set of SNPS/genes and continuous or
binary outcomes by including variant characteristic information and
using (weighted) score statistics.

**Note:**

  - From: <https://cran.r-project.org/package=MiST> (v1.0)
  - Reference: <https://doi.org/10.1002/gepi.21717>

## Installation

``` r
# Install MiST from CRAN:
install.packages("MiST")

# Or the the development version from GitHub:
# install.packages("remotes")
remotes::install_github("mcanouil/MiST")
```

## MiST in Action

``` r
library(MiST)
data(mist_data)
attach(mist_data)
```

### Continuous Outcome

``` r
mist(
  y = phenotypes[, "y_taupi"],
  X = phenotypes[, paste0("x_cov", 0:2)],
  G = genotypes,
  Z = variants_info[, 1, drop = FALSE]
)
#> [MiST] "y" seems to be "continuous", model is set to "continuous"!
#> [MiST] Linear regression is ongoing ...
#> 
#> MiST: Mixed effects Score Test
#> ------------------------------
#> 
#> - Estimate:
#> 
#>   SubClusters Pi_hat CI_2.5 CI_97.5
#> 1    cluster1  0.248 -0.389   0.885
#> 
#> - Statistics:
#> 
#>   + Overall effect: 
#>     * P-value = 0.031
#>   + PI (mean effect):  
#>     * Score = 0.601
#>     * P-value = 0.438
#>   + TAU (heterogeneous effect):  
#>     * Score = 1006.125
#>     * P-value = 0.011
```

### Binary Outcome

``` r
mist(
  y = phenotypes[, "y_binary"],
  X = phenotypes[, paste0("x_cov", 0:2)],
  G = genotypes,
  Z = variants_info[, 1, drop = FALSE]
)
#> [MiST] "y" seems to be "binary", model is set to "binary"!
#> [MiST] Logistic regression is ongoing ...
#> 
#> MiST: Mixed effects Score Test
#> ------------------------------
#> 
#> - Estimate:
#> 
#>   SubClusters Pi_hat CI_2.5 CI_97.5    OR
#> 1    cluster1  1.274   0.66   2.019 3.576
#> 
#> - Statistics:
#> 
#>   + Overall effect: 
#>     * P-value = 0
#>   + PI (mean effect):  
#>     * Score = 17.527
#>     * P-value = 0
#>   + TAU (heterogeneous effect):  
#>     * Score = 5.4
#>     * P-value = 0.175
```
