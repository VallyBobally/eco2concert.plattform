
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{eco2concert.plattform}`

<!-- badges: start -->

<!-- badges: end -->

## Installation

You can install the development version of `{eco2concert.plattform}`
like so:

``` r
install.packages("https://github.com/VallyBobally/...", repos = NULL, type = "source")
```

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
#> [1] "2025-05-20 10:25:14 CEST"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ══ Documenting ═════════════════════════════════════════════════════════════════
#> ℹ Installed roxygen2 version (7.3.2) doesn't match required (7.1.1)
#> ✖ `check()` will not re-document this package
#> ── R CMD check results ─────────────────── eco2concert.plattform 0.0.0.9000 ────
#> Duration: 18.9s
#> 
#> ❯ checking for future file timestamps ... NOTE
#>   unable to verify current time
#> 
#> 0 errors ✔ | 0 warnings ✔ | 1 note ✖
```

``` r
covr::package_coverage()
#> eco2concert.plattform Coverage: 0.00%
#> R/app_config.R: 0.00%
#> R/app_ui.R: 0.00%
#> R/run_app.R: 0.00%
```
