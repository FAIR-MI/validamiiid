#' editor UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_editor_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' editor Server Functions
#'
#' @noRd 
mod_editor_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_editor_ui("editor_1")
    
## To be copied in the server
# mod_editor_server("editor_1")
