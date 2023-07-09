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
    shiny::actionButton(ns("validate"), "Validate", icon = icon("check"))
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
      # Indicate to the user
      if(interaction_description$is_valid){
        showNotification(
          "The description is valid!", type = "message"
        )
      } else {
        showNotification(
          "The description is NOT valid!\nSee the output message", type = "error"
        )
      }
    })
  })
}

## To be copied in the UI
#

## To be copied in the server
#
