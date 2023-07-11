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
      if (interaction_description$is_valid) {
        shiny::showModal(shiny::modalDialog(
          title = "Share your description!",
          "You can contribute to FAIR descriptions of microbial interactions",
          "by submitting your validated YAML file to the MIIID GitHub.",
          br(), br(),
          helpText(
            "Make sure you have an account on Github before, or",
            tags$a(
              href = "https://github.com/signup", "signup there",
              target = "_blank", rel = "noopener noreferrer"
            ), "."
          ),
          easyClose = TRUE,
          footer = tagList(
            tags$a(
              class = "btn btn-primary",
              href = yaml_to_gh_issue(interaction_description$content),
              "Share you desription!",
              target = "_blank", rel = "noopener noreferrer"
            )
          )
        ))
      } else {
        showNotification("You need a validated file to contribute!")
      }
    })
  })
}

## To be copied in the UI
# mod_contribute_ui("contribute_1")

## To be copied in the server
#
