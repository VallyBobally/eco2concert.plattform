
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{eco2concert.plattform}`

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

## Installation

### Working with **golem** in VS Code

Although **golem** is designed for RStudio, it’s all standard R code and
a familiar folder structure—so VS Code works just fine.  
\> **Tip:** Install the “R” extension (and any recommended add-ons) when
prompted by VS Code.

To get started, run in your R console or VS Code R terminal:

``` r
install.packages("golem")
#> Installing package into 'C:/Users/apgkz/AppData/Local/Temp/RtmpGWT5b3/temp_libpath5f5c6fc9203c'
#> (as 'lib' is unspecified)
#> package 'golem' successfully unpacked and MD5 sums checked
#> 
#> The downloaded binary packages are in
#>  C:\Users\apgkz\AppData\Local\Temp\RtmpQ3Qmun\downloaded_packages
library(golem)

golem::install_dev_deps()
#> Warning in golem::install_dev_deps(): `install_dev_deps()` will not install dev
#> dependencies in non-interactive mode if `force_install` is not set to `TRUE`.
```

You may be prompted to install some dependencies. I would just install
them all.

## Run

You can launch the application by running:

``` r
eco2concert.plattform::run_app()
```

## About

You are reading the doc about version : 0.0.0.9000

This README has been compiled on the

``` r
Sys.time()
#> [1] "2025-05-21 11:11:05 CEST"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ══ Documenting ═════════════════════════════════════════════════════════════════
#> ℹ Installed roxygen2 version (7.3.2) doesn't match required (7.1.1)
#> ✖ `check()` will not re-document this package
#> ── R CMD check results ─────────────────── eco2concert.plattform 0.0.0.9000 ────
#> Duration: 24.8s
#> 
#> ❯ checking package dependencies ... NOTE
#>   Package suggested but not available for checking: 'spelling'
#> 
#> ❯ checking package subdirectories ... NOTE
#>   Problems with news in 'NEWS.md':
#>   No news entries found.
#> 
#> 0 errors ✔ | 0 warnings ✔ | 2 notes ✖
```

``` r
covr::package_coverage()
#> Error in loadNamespace(x): there is no package called 'covr'
```
