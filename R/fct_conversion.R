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

#' YAML to Github Issue
#'
#' @description This is to format/encode a URL with a template for an issue that
#' would carry over a YAML file to Github for further examination.
#' This function will be run only when validation was carried out.
#'
#' @return A character with the URL
#'
#' @noRd
yaml_to_gh_issue <- function(
    yaml_text,
    repo_url = "https://github.com/fair-mi/miiid-schema",
    assignees = "cpauvert",
    label = "miiid-sandbox",
    title = "Description of the interaction <INTERACTION_ID>",
    pre_yaml_template = base::paste(
      "<!--   Thank you for contributing!   -->",
      "<!--   Please edit the information below to suit your description   -->",
      "The following `YAML` file describes the interaction: <INTERACTION_ID>.",
      "", "```yaml",
      sep = "\n"
    ),
    post_yaml_template = base::paste(
      "```", "",
      "<!--   Your contribution is labelled as sandbox by default   -->",
      "<!--   If you want more than trying out:   -->",
      "<!--      you can label this issue miiid-contribution   -->",
      "<!--      instead of miiid-sandbox for further consideration   -->", "",
      "<!--   Feel free to add other relevant information,   -->",
      "<!--    and check the Preview tab ;)   -->",
      sep = "\n"
    )) {
  # Assemble the template together with the YAML text
  tmplt <- base::paste0(
    pre_yaml_template, "\n",
    yaml_text,
    post_yaml_template
  )
  # Extract the interaction identifier
  interaction_id <- base::gsub("^id: (.+)\\nparticipants.*", "\\1", yaml_text)
  interaction_id <- base::paste0("`", interaction_id, "`")
  title <- base::gsub("<INTERACTION_ID>", interaction_id, title)
  tmplt <- base::gsub("<INTERACTION_ID>", interaction_id, tmplt)

  # Concatenate the full URL
  issue_url <- base::paste0(
    repo_url, "/issues/new?",
    "assignees=", assignees,
    "&labels=", label,
    "&title=", title,
    "&body=", tmplt
  )
  return(utils::URLencode(issue_url))
}
