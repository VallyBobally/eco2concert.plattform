
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{eco2concert.plattform}`

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

## Working with **golem** in VS Code

Although **golem** is designed for RStudio, it’s all standard R code and
a familiar folder structure so VS Code works just fine.  
**Tip:** Install the “R” extension (and any recommended add-ons) when
prompted by VS Code.

To get started, run in your R console or VS Code R terminal:

``` r
install.packages("golem")
library(golem)

golem::install_dev_deps()
```

You may get prompted to install some dependencies. I would just install
them all.

## Project Structure

Details on the structure used by the **golem** package can be found
[here for example](https://engineering-shiny.org/golem.html). But below
you find my personal notes on it.

1.  **`Eco2concert.plattform.Rproj`**
    - Only useful when using **RStudio**  
    - Sets the working directory (so file paths work properly) + loads
      project settings  
    - It **does not run any code** unless you’ve added special code into
      an `.Rprofile` file (ignore when using VS Code)
2.  **`.gitignore`** and **`.Rbuildignore`**
    - Tells Git which files to ignore, tells R which files to skip when
      building the package  
    - These files will still be on your computer, but they won’t be
      uploaded or built
3.  **`LICENSE`, `README`, `NEWS`, `CODE_OF_CONDUCT`**
    - Common files in a code project  
    - Not always required, but often useful for sharing or publishing
4.  **`DESCRIPTION`** file
    - Created at start of golem project, containing meta data like
      - Project name, description, license  
      - Which R packages needed  
    - During development, the command `attachment::att_amend_desc()`
      updates it with required packages under “imports”:
      - `attachment` function scans all scripts in the `R/` folder for
        package dependencies
5.  **`NAMESPACE`**
    - ⚠️ **Do not edit this manually!**  
    - Automatically created by commands like `devtools::document()`  
    - It lists:
      - Which functions from other packages your app uses  
      - Which of your functions should be available to users
6.  **`dev/`** folder
    - Has helper scripts for setting up your project  
    - Use `02_dev.R` during development  
    - Use `03_deploy.R` when you’re ready to publish/share the app
7.  **`man/`** folder
    - Automatically filled during development  
    - Contains help pages for your functions
8.  **`inst/app/www/`** folder
    - Stores files used by the browser, like CSS (styles), JavaScript
      (interactions), images, etc.  

    - You can link to these in HTML using the `"www/"` path  

    - In R code, use `app_sys()` to get the correct path, like:

      ``` r
      includeMarkdown(app_sys("app/www/howto.md"))
      ```
9.  **`R/`** folder
    - This is where the main app code lives:
      - The `ui` and `server` scripts  
      - All modules  
      - Helper functions
10. **`R/golem_utils_ui.R`** and **`R/golem_utils_server.R`**
    - These files include small, reusable snippets of code/functions
      (e.g., 3 lines long, so no extra module script is necessary)
    - For example:
      - Define aliases like `rv` for `reactiveValues` to save keystrokes
      - Functions to turn a list into HTML tags
11. **`tests/`** folder
    - Created by `{golem}` package automatically  
    - Contains basic test scripts to check functioning UI and server
      code  
    - You can of course add own test cases/scripts

## Module Structure

### Creating or adding modules

- Use `golem::add_module()` to create a new module (can be run directly
  from the R console or by executing the code in the `dev/02_dev.R`
  file)
- The prefix `mod_` is automatically added to the module name, so for
  the `name` argument, just use the name you want to give the module
  (e.g., `name = "about_tab"`)
- Modules created by `golem::add_module()` are automatically stored in
  the `R/` folder, will always have the same structure and a
  corresponding test file in the `tests/testthat/` folder is added so I
  suggest we stick to this procedure of creating new modules

### Module structure (documentation part)

- Above the actual function code you can write `Roxygen2` documentation
  from which you can create help files using `devtools::document()` or
  `golem::document_and_reload()` (used for help pages, manuals and
  references for the users of the final Shiny App)
- You can add a description of the module (`@description`), of the input
  parameters (`@param`), tell `roxygen2` to not create a `help` file
  with `@noRD`, import specific functions from packages with
  `@importFrom`and the output (`@return`) in the module script

### Module structure (ui and server part)

- You basically simply define a function to be integrated into the
  overarching `app_ui.R` and `app_server.R` files without cluttering the
  code there
- The first part of the module contains the function for the UI code,
  the second part the one for the server code
- Just two quick things I came across and want to share:
  - The `NS` function should always be called on the **UI-element id**
    or the **server-session id**

  ``` r
  ns <- NS(id)
  ```

  - `tagList()` makes sure the output of the function is not one single
    object but a list of objects (e.g., if you want to return/render
    multiple UI elements)
- You can use the modules I’ve already created as templates for further
  modules or look into this
  [video](https://www.youtube.com/watch?v=_zm2GuSrZ14&t=6319s) which I
  found very helpful

### Other stuff

- In `02_dev.R` you find further code to initiate all sorts of files
  (vignettes, js_handlers, … ) and how to incorporate data sets or to
  check for code coverage
- There are functions to initate workflows with GitHub actions or other
  systems

## How to run the app

### in VS Code

- Either run the whole `run_dev.R` script (for documenting purposes
  e.g.) or simply run `run_app()` in the console
- The Shiny App will open in a new VS Code Window (by clicking on the
  URL in the console, you can open it in your browser) \### in RStudio
- You can go to the ‘Addins’ tab below the menu bar and select ‘Run
  run_dev.R’ under the ‘golem’ section  
- Or do it the same way as for VS Code

## Let’s start developing!

- I would suggest you click through everything in your own time and get
  familiar with the structure
- I hope this little guide helps with initial understanding!
