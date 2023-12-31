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
      shinyAce::aceEditor(
        outputId = ns("ace_editor"),
        fontSize = 18,
        mode = "yaml", theme = "kuroir",
        value = "YAML file",
        placeholder = "Write a description of a microbial interaction...",
        height = "300px",
        tabSize = 2,
        autoComplete = "live",
        autoCompleters = "static",
        # TODO: move the properties to a utils (business-logic) function, or package data
        autoCompleteList = list(
          required = c("id", "participants", "tax_id", "evidence_type", "reference"),
          recommended = c("sequence_id", "method_type","env_exp", "participants_outcomes")
        )
      )
    )
  )
}

#' editor Server Functions
#'
#' @noRd
mod_editor_server <- function(id, interaction_description) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    observeEvent(input$ace_editor,
      {
        shinyAce::updateAceEditor(
          session, "ace_editor",
          value = interaction_description$content
        )
      },
      once = TRUE
    )
    gargoyle::on("clear", {
      shinyAce::updateAceEditor(session, "ace_editor", value = "")
    })
    gargoyle::on("valid_ex", {
      shinyAce::updateAceEditor(
        session, "ace_editor",
        value = validamiiid::valid_example_miiid
      )
      interaction_description$content <- validamiiid::valid_example_miiid
    })
    gargoyle::on("invalid_ex", {
      shinyAce::updateAceEditor(
        session, "ace_editor",
        value = validamiiid::invalid_example_miiid
      )
      interaction_description$content <- validamiiid::invalid_example_miiid
    })
    gargoyle::on("validate", {
      interaction_description$content <- input$ace_editor
      })
  })
}

## To be copied in the UI
# mod_editor_ui("editor_1")

## To be copied in the server
# mod_editor_server("editor_1")
