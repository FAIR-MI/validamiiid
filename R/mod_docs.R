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
                "Start describing interactions between microbial",
                "entities in the editor"
              ),
              tags$li(
                "Use the (autocompleted) required and",
                "recommended metadata from MIIID"
              ),
              tags$li("Or load examples in the editor to play around"),
              tags$li("Validate the description against the metadata schema"),
              tags$li("Share your draft description eventually on the MIIID GitHub")
            )
          )
        ),
        bslib::nav_panel(
          "MIIID",
          align = "left",
          bslib::card_body(
            tags$p(
              "It stands for Minimal Information about Intermicrobial Interaction Data (MIIID).",
              "We",
              tags$a(href = "https://doi.org/10.1128/msystems.00659-22", "suggested"),
              "a couple of metadata to achieve this goal."
            ),
            tags$p(
              "This metadata schema is developped using the",
              tags$a(href = "https://linkml.io", "LinkML"),
              "modeling language.", "More details and terms definition can be search on the",
              tags$a(
                href = "https://fair-mi.github.io/miiid-schema/",
                "dedicated MIIID website", .noWS = "after"
              ), "."
            )
          )
        ),
        bslib::nav_panel(
          "Help",
          tags$p(
            tags$em("Where to find the definition of a specific metadata?"),
            "In LinkML, they are called _slots_ and can be looked up",
            "on", tags$a(
              href = "https://fair-mi.github.io/miiid-schema/",
              "fair-mi.github.io/miiid-schema", .noWS = "after"
            ), "."
          ),
          tags$p(
            tags$em("How to fill out the", tags$code("evidence_type")),
            "Browse to the",
            tags$a(
              href = "https://evidenceontology.org/browse/#ECO_0000000",
              "Evidence & Conclusion Ontology"
            ),
            "to find an evidence term relevant for your case"
          )
        ),
        bslib::nav_panel(
          icon = shiny::icon("github"), title = "", align = "left",
          bslib::card_body(
            tags$p(
              tags$code("{validamiiid}"),
              "is a", tags$code("{shiny}"), "application developped using", tags$code("{golem}"),
              "It uses the JSON schema artefact exported from the MIIID schema developed with the LinkML framework."
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
  })
}

## To be copied in the UI
# mod_docs_ui("docs_1")

## To be copied in the server
# mod_docs_server("docs_1")
