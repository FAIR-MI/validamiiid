InteractionDescription <- R6::R6Class(
  "InteractionDescription",
  public = list(
    content = paste(
      c(
        "id: miiid:001_or_example # ID",
        "participants:",
        rep("  -  # <PARTICIPANT_NAME>", 3),
        "tax_id:",
        rep("  -  # <PARTICIPANT_TAX_ID>", 3),
        "evidence_type:  # <USING Evidence & Conclusion Ontology (ECO)>",
        "reference:  # <DOI>"
      ),
      collapse = "\n"
    ),
    is_valid = NULL,
    error_validation = NULL,
    # Impossible to assign the validate function as a R6 method
    # so wrapping a function around to have correct method
    miiid_validator = function(json) {
      mv <- jsonvalidate::json_validator(
        system.file("extdata", "miiid_jsonschema.json", package = "validamiiid"),
        engine = "ajv"
      )
      return(mv(json, verbose = T))
    },
    # Validation procedure,
    # update $content if valid and add $is_valid flag
    # if not provide an $error_validation and FALSE $is_valid
    #
    # TODO: error handling when incomplete id (miiid:SPACE issues a yaml.load error)
    validate = function() {
      # Convert
      json <- yaml_to_json(self$content)
      # Validate
      vld_output <- self$miiid_validator(json)
      # Update object
      self$is_valid <- as.logical(vld_output)
      if (self$is_valid) {
        self$error_validation <- NULL
        self$content <- json_to_yaml(json)
      } else {
        self$error_validation <- parse_validator(vld_output)
      }
      invisible(self)
    }
  )
)
