InteractionDescription <- R6::R6Class(
  "InteractionDescription",
  public = list(
    default_content = paste(
        c(
          "id: miiid: # ID",
          "participants:",
          rep("  -  # <PARTICIPANT_NAME>", 3),
          "tax_id:",
          rep("  -  # <PARTICIPANT_TAX_ID>", 3),
          "evidence_type:  # <USING Evidence & Conclusion Ontology (ECO)>",
          "reference:  # <DOI>"
        ),
        collapse = "\n"
      ),
  content = NULL,
  to_json = function(yaml) {self$content <- yaml_to_json(yaml)},
  to_yaml = function(json) {self$content <- json_to_yaml(json)},
  validate = function() {}, # method
  download = function() {}  # method
  )
)
