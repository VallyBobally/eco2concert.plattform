#' festival_input UI
#'
#' @description A Shiny Module. For input data from user regarding own festival.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' # means: don't generate documentation file for this function (is documented function but internal building block)
#' @noRd
#'
#' @importFrom shiny NS tagList textInput selectInput numericInput actionButton absolutePanel
mod_festival_input_ui <- function(id) {
  ns <- NS(id)
  tagList(
    golem_add_external_resources(),
    absolutePanel(
      id = "explainText", class = "panel panel-default", fixed = TRUE, top = 190, left = "50%", right = "auto", bottom = "auto",
      width = "auto", height = "auto",

      h3("BASISDATEN"),

      textInput(ns("festival_name"), "Name des Festivals", value = "Mein Festival"),
      numericInput(ns("festival_year"), "Jahr", value = 2025, min = 2000),
      numericInput(ns("visitor_number"), "Anzahl Besucher:innen", value = 5000, min = 0),
      selectInput(ns("festival_type"), "Art des Festivals", choices = c("Urban", "Semi-Urban", "Greenfield")),
      selectInput(ns("festival_duration"), "Dauer des Festivals", choices = c("1 Tag", "2 Tage", "3 Tage", "4 Tage")),
      actionButton(ns("simulate_btn"), "Simulation starten")
      )
  )
  }

#' festival_input Server Functions
#'
#' @noRd
mod_festival_input_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    observeEvent(input$simulate_btn, {

      # reset first feedback after repeated input - important!
      shinyFeedback::hideFeedback("festival_name")
      shinyFeedback::hideFeedback("festival_year")
      shinyFeedback::hideFeedback("visitor_number")
      shinyFeedback::hideFeedback("festival_type")
      shinyFeedback::hideFeedback("festival_duration")

      # Initialize a flag
      valid <- TRUE

      # Validate festival_name (if conditions true, valid-flag set to FALSE)
      if (nchar(input$festival_name) < 1 || nchar(input$festival_name) > 100) {
        shinyFeedback::showFeedbackDanger("festival_name", "Der Festivalname muss mindestens 1, maximal 100 Zeichen lang sein.")
        valid <- FALSE
      }

      # Validate festival_year
      if (is.na(input$festival_year)) {
        shinyFeedback::showFeedbackDanger("festival_year", "Bitte gib eine Jahreszahl ein.")
        valid <- FALSE
      } else if (input$festival_year < 2000 || input$festival_year > 2030) {
        shinyFeedback::showFeedbackDanger("festival_year", "Die Jahreszahl muss zwischen 2000 und 2030 liegen.")
        valid <- FALSE
      }

      # Validate visitor_number
      if (is.na(input$visitor_number)) {
        showFeedbackDanger("visitor_number", "Dieses Feld darf nicht leer bleiben.")
        valid <- FALSE
      } else if (input$visitor_number < 1 || input$visitor_number > 100000) {
        showFeedbackDanger("visitor_number", "Die Zahl muss zwischen 1 und 100000 liegen.")
        valid <- FALSE
      }

      # validate festival_type
      if (input$festival_type == "") {
        showFeedbackDanger("festival_type", "Bitte wähle einen Festivaltyp aus.")
        valid <- FALSE
      }

      # Only proceed if all inputs are valid
      if (valid) {
        showModal(
          modalDialog(
            title = "Das hat geklappt",
            "Deine Eingaben wurden gespeichert!",
            easyClose = TRUE,
            footer = modalButton("Schließen")  # Change 'dismiss' to 'Schließen'
          )
        )

        # save to CSV
        user_data <- data.frame(
          festival_name = input$festival_name,
          festival_year = input$festival_year,
          festival_type = input$festival_type,
          visitor_number = input$visitor_number,
          festival_duration = input$festival_duration,
          timestamp = Sys.time()
        )

      # Write or append line to CSV
      output_file <- "data/festival_inputs.csv"

      if (!file.exists(output_file)) {
        write.csv(user_data, output_file, row.names = FALSE)
      } else {
        write.table(user_data, output_file, row.names = FALSE, sep = ",", col.names = FALSE, append = TRUE)
      }
    }
  })
  })
}

## To be copied in the UI
# mod_festival_input_ui("festival_input")

## To be copied in the server
# mod_festival_input_server("festival_input")

