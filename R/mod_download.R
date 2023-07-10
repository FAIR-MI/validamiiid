#' download UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_download_ui <- function(id) {
  ns <- NS(id)
  tagList(
    shiny::downloadButton(ns("download"))
  )
}

#' download Server Functions
#'
#' @noRd
mod_download_server <- function(id, interaction_description) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    output$download <- downloadHandler(
      filename = function() {
        paste0(
          "MIIID-",
          ifelse(
            interaction_description$is_valid,
            "validated", "nonvalidated"
          ), "-InteractionDescription-", ".yaml"
        )
      },
      content = function(file) {
        write(interaction_description$content, file)
      }
    )
  })
}

## To be copied in the UI
# mod_download_ui("download_1")

## To be copied in the server
#
