#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # adding external resources
    golem_add_external_resources(),
    shinyFeedback::useShinyFeedback(),
    # Your application UI logic
    fluidPage(
      div(class = "background-image-wrapper"), #festival pic is background for every tab = good
      navbarPage(

        title = mod_app_navbar_title_ui("app_navbar_title"),
        windowTitle = "ECO2CONCERT",

        # explanation text
        tabPanel("About", mod_about_tab_ui("about_tab")),


        # Festival Data Input Panel
        tabPanel(HTML('<span style="font-size:100%;color:white;font-weight:normal;">Deine Festivaldaten</span>'),
                 #Main content for the Festival Data Input

                 absolutePanel(mod_form_festival_input_ui("form_festival_input")),

                 absolutePanel(mod_festival_input_ui("festival_input"))
                 )
        )
      )
  )
  }

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "myappV"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
