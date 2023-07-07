#' editor UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_editor_ui <- function(id) {
  ns <- NS(id)
  tagList(
    bslib::layout_columns(
      shiny::uiOutput(ns("ace_editor"))
    )
  )
}

#' editor Server Functions
#'
#' @noRd
mod_editor_server <- function(id) {
  moduleServer(id, function(input, output, session, interaction_description) {
    ns <- session$ns
    output$ace_editor <- renderUI({
      shinyAce::aceEditor(ns("editor"),
        fontSize = 18,
        mode = "yaml", theme = "kuroir",
        # TODO: move the value to a utils (business-logic) function, or package data
        value = interaction_description$default_content,
        height = "300px",
        tabSize = 2,
        autoComplete = "live",
        autoCompleters = "static",
        # TODO: move the properties to a utils (business-logic) function, or package data
        autoCompleteList = list(
          required = c("id","participants", "tax_id", "evidence_type", "reference"),
          recommended = c("participants_outcome")
        )
      )
    })
  })
}

## To be copied in the UI
# mod_editor_ui("editor_1")

## To be copied in the server
# mod_editor_server("editor_1")
