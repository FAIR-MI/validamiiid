#' examples_reset UI Function
#'
#' @description A shiny Module with the control buttons to load examples and clean the editor
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_examples_reset_ui <- function(id){
  ns <- NS(id)
  tagList(
    bslib::layout_columns(
      shiny::actionLink(ns("load_valid_ex"), "Load valid example"),
      shiny::actionLink(ns("load_invalid_ex"), "Load invalid example"),
      shiny::actionLink(ns("reset_editor"), "Clear editor text")
    )
  )
}

#' examples_reset Server Functions
#'
#' @noRd
mod_examples_reset_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    # Here would be the updatefunctions to update the editor
  })
}

## To be copied in the UI
# mod_examples_reset_ui("examples_reset_1")

## To be copied in the server
# mod_examples_reset_server("examples_reset_1")
