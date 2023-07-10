#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Start by instantiating a R6 object to exchange data (src: chap 15 Engineering Shiny)
  r6 <- InteractionDescription$new()

  # Triggers/watchers for better reactivity control with {gargoyle}
  gargoyle::init("clear", "valid_ex", "invalid_ex", "validate")
  # Your application server logic
  mod_editor_server("editor_1", r6)
  mod_examples_reset_server("examples_reset_1")
  mod_validate_server("validate_1", r6)
  mod_errors_table_server("errors_table_1", r6)
  mod_docs_server("docs_1")
  mod_contribute_server("contribute_1", r6)
  mod_download_server("download_1", r6)
}
