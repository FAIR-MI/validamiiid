#' contribute UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_contribute_ui <- function(id) {
  ns <- NS(id)
  tagList(
    shiny::actionButton(ns("contribute"), "Share", icon = icon("share-from-square"))
  )
}

#' contribute Server Functions
#'
#' @noRd
mod_contribute_server <- function(id, interaction_description) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    observeEvent(input$contribute, {
      if (is.null(interaction_description$is_valid)) {
        showNotification("You need a validated file to contribute!")
        if (interaction_description$is_valid) {
          browseURL(yaml_to_gh_issue(interaction_description$content))
        } else {
          showNotification("You need a validated file to contribute!")
        }
      }
    })
  })
}

## To be copied in the UI
# mod_contribute_ui("contribute_1")

## To be copied in the server
#
