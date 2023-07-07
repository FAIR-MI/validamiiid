InteractionDescription <- R6::R6Class(
  "InteractionDescription",
  public = list(
    default_content = paste(
        c(
          "id: miiid: # ID",
          "participants:",
          rep("  -  # <PARTICIPANT>", 3),
          "tax_id:",
          rep("  -  # <PARTICIPANT_TAX_ID>", 3),
          "evidence_type:  # <USING Evidence & Conclusion Ontology (ECO)>",
          "reference:  # <DOI>"
        ),
        collapse = "\n"
      )
  ),
  clear = function() {},
  to_json = function() {},
  to_yaml = function() {},
  validate = function() {}, # method
  download = function() {}  # method
)
