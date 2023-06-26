#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    bslib::page_fill(
      theme = bslib::bs_theme(
        version = 5, bootswatch = "default",
        primary = "#2892d7", warning = "#ff7477",
        base_font = bslib::font_link("Hack", "https://cdnjs.cloudflare.com/ajax/libs/hack-font/3.3.0/web/hack.min.css")
      ),
      title = "valida-miiid",
      column(
        width = 12, align = "center",
        h1(strong("valida-miiid")),
        tags$br(), tags$br(),
        column(
          width = 6,
          mod_editor_ui("editor_1")
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "valida-miiid"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
