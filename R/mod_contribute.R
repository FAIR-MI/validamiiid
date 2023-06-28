#' contribute UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_contribute_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny::actionButton(ns("contribute"), "Share", icon = icon("share-from-square"))
  )
}

#' contribute Server Functions
#'
#' @noRd
mod_contribute_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_contribute_ui("contribute_1")

## To be copied in the server
# mod_contribute_server("contribute_1")
