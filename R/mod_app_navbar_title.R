#' app_navbar_title UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_app_navbar_title_ui <- function(id) {
  ns <- NS(id)
  tagList(
    HTML('<a style="text-decoration:none;cursor:default;color:#FFFFFF;font-weight:normal;"
           class="active" href="#">ECO2CONCERT Planungsplattform</a>')
  )
}

#' app_navbar_title Server Functions
#'
#' @noRd
mod_app_navbar_title_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_app_navbar_title_ui("app_navbar_title")

## To be copied in the server
# mod_app_navbar_title_server("app_navbar_title")

