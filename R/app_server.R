#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Start by instantiating a R6 object to exchange data (src: chap 15 Engineering Shiny)
  r6 <- InteractionDescription$new()
  # Your application server logic
  mod_editor_server("editor_1", r6)
}
