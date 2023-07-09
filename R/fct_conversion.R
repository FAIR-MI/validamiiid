#' YAML-to-JSON conversion
#'
#' @description This function converts a YAML string and convert into JSON string.
#'
#' @return A character vector
#'
#' @noRd
yaml_to_json <- function(yaml_text){
  # Convert a text representation of a YAML to JSON string
  # Trying to limit writing files in the shiny app
  yaml::read_yaml(text = yaml_text) %>%
    jsonlite::toJSON(., auto_unbox = TRUE) %>%
    as.character()
}
