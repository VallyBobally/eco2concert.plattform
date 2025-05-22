#' about_tab UI Function
#'
#' @description A shiny Module. Containing the text describing the "about" of the app.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_about_tab_ui <- function(id) {
  ns <- NS(id)
  tagList(tags$iframe(
    src = "www/about_page.html",
    width = "100%",
    height = "800px",
    frameborder = "0")
  )
}

#' test_module1 Server Functions
#'
#' @noRd
mod_test_module1_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_about_tab_ui("about_tab")

## To be copied in the server
# mod_about_tab_server("about_tab")

