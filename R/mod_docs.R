#' docs UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_docs_ui <- function(id) {
  ns <- NS(id)
  tagList(
    bslib::layout_columns(
      bslib::navset_card_pill(
        bslib::nav_panel(
          icon = shiny::icon("circle-info"), title = "", align = "left",
          bslib::card_title("Microbial interactions descriptions for human and machines alike"),
          bslib::card_body(
            tags$ol(
              tags$li(
                tags$strong("Describe"), "interactions between microbial",
                "entities in the editor"
              ),
              tags$li(
                "Use the (autocompleted)", tags$strong("required"), "and",
                tags$strong("recommended"), "metadata from MIIID"
              ),
              tags$li(tags$em("Or load examples in the editor to play around")),
              tags$li(tags$strong("Validate"), "the description against the metadata schema"),
              tags$li(tags$strong("Share"), "your draft description eventually on the MIIID GitHub")
            )
          )
        ),
        bslib::nav_panel(
          "MIIID",
          align = "left",
          bslib::card_body(
            tags$p(
              "It stands for",
              tags$strong("M", .noWS = "after"), "inimal",
              tags$strong("I", .noWS = "after"), "nformation about",
              tags$strong("I", .noWS = "after"), "ntermicrobial",
              tags$strong("I", .noWS = "after"), "nteraction",
              tags$strong("D", .noWS = "after"), "ata (MIIID),",
              "and could be developed from",
              tags$a(
                href = "https://doi.org/10.1128/msystems.00659-22",
                "previously suggested metadata",
                .noWS = "after"
              ),
              "."
            ),
            tags$p(
              "This metadata schema is developped using the",
              tags$a(href = "https://linkml.io", "LinkML"),
              "modeling language.", "More details and terms definition can be search on the",
              tags$a(
                href = "https://fair-mi.github.io/miiid-schema/",
                "dedicated MIIID website", .noWS = "after"
              ), "."
            ),
            helpText("Support the MIIID by adding a star to our Github!")
          )
        ),
        bslib::nav_panel(
          "Help",
          align = "left",
          tags$p(
            tags$strong("Where to find the definition of a specific metadata?"),
            "In LinkML, they are called", tags$em("slots"), "and can be looked up",
            "on", tags$a(
              href = "https://fair-mi.github.io/miiid-schema/",
              "fair-mi.github.io/miiid-schema", .noWS = "after"
            ), "."
          ),
          tags$p(
            tags$strong("How to fill out the", tags$code("evidence_type", .noWS = "after"), "?"),
            "Browse to the",
            tags$a(
              href = "https://evidenceontology.org/browse/#ECO_0000000",
              "Evidence & Conclusion Ontology"
            ),
            "to find an evidence term relevant for your case."
          )
        ),
        bslib::nav_panel(
          icon = shiny::icon("github"), title = "", align = "left",
          bslib::card_body(
            tags$p(
              tags$a(
                href = "https://github.com/FAIR-MI/validamiiid",
                tags$code("{validamiiid}", .noWS = "after")
              ), "is a",
              tags$a(
                href = "https://shiny.posit.co",
                tags$code("{shiny}", .noWS = "after")
              ), "application developped using",
              tags$a(
                href = "https://thinkr-open.github.io/golem",
                tags$code("{golem}", .noWS = "after"), .noWS = "after",
              ), ".",
              "It uses the",
              tags$a(
                href = "https://linkml.io/linkml/generators/json-schema.html",
                "JSON schema artefact"
              ),
              "exported from the MIIID schema",
              textOutput(ns("schema_version"),inline = TRUE),
              "developed with the LinkML framework, and",
              tags$a(
                href = "https://docs.ropensci.org/jsonvalidate",
                tags$code("{jsonvalidate}", .noWS = "after"),
              ),
              "to perform the validation."
            )
          )
        )
      )
    ),
  )
}

#' docs Server Functions
#'
#' @noRd
mod_docs_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    output$schema_version <- renderText({
      paste0("(v", get_schema_version(),")")
    })
  })
}

## To be copied in the UI
# mod_docs_ui("docs_1")

## To be copied in the server
#
