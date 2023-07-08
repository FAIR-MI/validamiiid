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
mod_editor_server <- function(id, interaction_description) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    output$ace_editor <- renderUI({
      shinyAce::aceEditor(ns("ace_editor"),
        fontSize = 18,
        mode = "yaml", theme = "kuroir",
        value = interaction_description$default_content,
        placeholder = "Write a description of a microbial interaction...",
        height = "300px",
        tabSize = 2,
        autoComplete = "live",
        autoCompleters = "static",
        # TODO: move the properties to a utils (business-logic) function, or package data
        autoCompleteList = list(
          required = c("id", "participants", "tax_id", "evidence_type", "reference"),
          recommended = c("participants_outcome")
        )
      )
    })
    observeEvent(input$reset_editor, {
      gargoyle::watch("clear")
      shinyAce::updateAceEditor(session, ns("ace_editor"), value = "")
    })
  })
}

## To be copied in the UI
# mod_editor_ui("editor_1")

## To be copied in the server
# mod_editor_server("editor_1")
