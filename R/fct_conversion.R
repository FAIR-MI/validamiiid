#' YAML-to-JSON conversion
#'
#' @param yaml_text A YAML string
#'
#' @description This function converts a YAML string and convert into JSON string.
#'
#' @return A character vector
#'
#' @noRd
yaml_to_json <- function(yaml_text) {
  # Convert a text representation of a YAML to JSON string
  # Trying to limit writing files in the shiny app
  yaml::read_yaml(text = yaml_text) %>%
    jsonlite::toJSON(., auto_unbox = TRUE) %>%
    as.character()
}

#' JSON-to-YAML conversion
#'
#' @description converts (and lint) a JSON string vector into YAML string
#'
#' @param json_text A character vector of the JSON text
#'
#' @return A character vector
#' @noRd
json_to_yaml <- function(json_text) {
  # Convert a text representation of a JSON to a YAML string
  jsonlite:::fromJSON(json_text) %>%
    yaml::as.yaml(., indent.mapping.sequence = TRUE)
}
