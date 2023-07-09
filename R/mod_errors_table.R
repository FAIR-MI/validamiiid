#' errors_table UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_errors_table_ui <- function(id) {
  ns <- NS(id)
  tagList(
    tableOutput(ns("errors_parser"))
  )
}

#' errors_table Server Functions
#'
#' @noRd
mod_errors_table_server <- function(id, interaction_description) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    output$errors_parser <- renderTable(
      {
        gargoyle::watch("validate")
        if (!is.null(interaction_description$error_validation)) {
          interaction_description$error_validation
        }
      },
      caption = paste("The YAML description does not (yet)",
        "comply to the MIIID schema.",
        "The validation errors, such as missing",
        "properties, are indicated below.",
        collapse = "\n"
      ),
      caption.placement = "top",
      width = "100%"
    )
  })
}

## To be copied in the UI
#

## To be copied in the server
#
