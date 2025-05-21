
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{eco2concert.plattform}`

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

## Installation

### Working with **golem** in VS Code

Although **golem** is designed for RStudio, it’s all standard R code and
a familiar folder structure so VS Code works just fine.  
\> **Tip:** Install the “R” extension (and any recommended add-ons) when
prompted by VS Code.

To get started, run in your R console or VS Code R terminal:

``` r
install.packages("golem")
library(golem)

golem::install_dev_deps()
```

You may be prompted to install some dependencies. I would just install
them all.

## Project Structure

1.  **`Eco2concert.plattform.Rproj`**
    - Only useful when using **RStudio**  
    - Sets the working directory (so file paths work properly)  
    - Loads project settings  
    - It **does not run any code** unless you’ve added special code to
      `.Rprofile`
2.  **`.gitignore` and `.Rbuildignore`**
    - `.gitignore`: Tells Git which files to ignore  
    - `.Rbuildignore`: Tells R which files to skip when building the
      package  
    - These files will still be on your computer, but they won’t be
      uploaded or built
3.  **`LICENSE`, `README`, `NEWS`, `CODE_OF_CONDUCT`**
    - Common files in a code project  
    - Not always required, but often useful for sharing or publishing
4.  **`DESCRIPTION` file**
    - Created when you start the project  
    - Stores info like:
      - Project name, description, license  
      - Which R packages are needed  
    - During development, the command `attachment::att_amend_desc()`
      updates it:
      - It adds all the packages your code uses automatically under
        “Imports”
5.  **`NAMESPACE`**
    - ⚠️ **Do not edit this manually!**  
    - Automatically created by commands like `devtools::document()`  
    - It lists:
      - Which functions from other packages your app uses  
      - Which of your functions should be available to users
6.  **`dev/` folder**
    - Has helper scripts for setting up your project  
    - Use `02_dev.R` during development  
    - Use `03_deploy.R` when you’re ready to publish/share the app
7.  **`man/` folder**
    - Automatically filled during development  
    - Contains help pages for your functions
8.  **`inst/app/www/` folder**
    - Stores files used by the browser, like:

      - CSS (styles), JavaScript (interactions), images, etc.  

    - You can link to these in HTML using the `"www/"` path  

    - In R code, use `app_sys()` to get the correct path, like:

      ``` r
      includeMarkdown(app_sys("app/www/howto.md"))
      ```
9.  **`R/` folder**
    - This is where your main app code lives:
      - The `ui` and `server` scripts  
      - All modules  
      - Helper functions
10. **`R/golem_utils_ui.R` and `R/golem_utils_server.R`**
    - These files hold small, reusable bits of code  
    - For example:
      - Shortcuts like typing `rv` instead of `reactiveValues`  
      - Functions to clean a list  
      - Functions to turn a list into HTML tags  
    - These are helpful when you need small utilities that don’t need
      full modules
11. **`tests/` folder**
    - Created by the `{golem}` package automatically  
    - Contains basic test scripts to check your UI and code  
    - You can add your own tests too
