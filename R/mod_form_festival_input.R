#' form_festival_input UI Function
#'
#' @description A shiny Module.For descriptive text on user input formular page.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_form_festival_input_ui <- function(id) {
  ns <- NS(id)
  tagList(
    absolutePanel(
      id = "explainText", class = "panel panel-default", fixed = TRUE, top = 60, left = "50%", right = "auto", bottom = "auto",
      width = 450, height = 120,
      h4(HTML('<div style="text-align:justify;">
              Gib hier Daten über dein Festival ein, die in der Simulation verwendet werden. <br>
              Optionale Daten machen die Simulation genauer. Wenn du sie weglässt, verwenden wir Durchschnittswerte.
            </div>'))

  ))
}

#' form_festival_input Server Functions
#'
#' @noRd
mod_form_festival_input_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_form_festival_input_ui("mod_form_festival_input")

## To be copied in the server
# mod_form_festival_input_server("mod_form_festival_input")

