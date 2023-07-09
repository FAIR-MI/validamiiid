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
mod_validate_server <- function(id,interaction_description){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    observeEvent(input$validate, {
      # Will copy the editor content to R6
      gargoyle::trigger("validate")
      # To then be validated
      interaction_description$validate()
    })
  })
}

## To be copied in the UI
#

## To be copied in the server
#
