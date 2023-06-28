#' validate UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_validate_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny::actionButton(ns("validate"), "Validate", icon = icon("check")),
  )
}

#' validate Server Functions
#'
#' @noRd
mod_validate_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_validate_ui("validate_1")

## To be copied in the server
# mod_validate_server("validate_1")
