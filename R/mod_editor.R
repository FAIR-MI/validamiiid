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
    shiny::fluidRow(
      bslib::layout_column_wrap(
        width = "8em", fixed_width = TRUE,
        shiny::actionLink(ns("reset_editor"), "Clear text"),
        shiny::actionLink(ns("load_example"), "Load example")
      )
    ), shiny::br(),
    shiny::fluidRow(shiny::uiOutput(ns("ace_editor"))),
    shiny::fluidRow(
      bslib::layout_column_wrap(
        width = 1 / 4,
        shiny::actionButton(ns("validate"), "Validate"),
        shiny::actionButton(ns("save"), "Save"),
        shiny::downloadButton(ns("download")),
        shiny::actionButton(ns("contribute"), "Contribute")
      )
    )
  )
}

#' editor Server Functions
#'
#' @noRd
mod_editor_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$ace_editor <- renderUI({
      shinyAce::aceEditor(ns("editor"),
        fontSize = 18,
        mode = "yaml", theme = "kuroir",
        value = "participants:\n  - foo\n  - bar\nevidence_type: experimental",
        height = "200px",
        tabSize = 2,
        autoComplete = "live",
        autoCompleters = "static",
        autoCompleteList = list(
          MIIID = c("participants","tax_id","evidence_type","reference","participants_outcome")
        )
      )
    })
  })
}

## To be copied in the UI
# mod_editor_ui("editor_1")

## To be copied in the server
# mod_editor_server("editor_1")
