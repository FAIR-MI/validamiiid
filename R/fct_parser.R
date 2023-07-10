#' Parse JSON validator
#' @param validator_result The object resulting from jsonvalidate::json_validator used with verbose = T
#'
#' @description Parsing JSON validate results

#'
#' @return A data.frame with instancePath indicating the faulty property and message columns.
#'
#' @noRd
parse_validator <- function(validator_result) {
  if (is.null(attr(validator_result, "errors"))) {
    stop("This validator result is not valid. Please run the validator with verbose = TRUE.")
  }
  errors_df <- attr(validator_result, "errors")
  errors_df <- errors_df[, c("instancePath", "message")]
  names(errors_df) <- c("property", "message")
  return(errors_df)
}

#' get_schema_version
#'
#' @description Extract the release version of the MIIID schema used for validation.
#'
#' @return a character
get_schema_version <- function() {
  jsonlite::read_json(
    system.file(
      "extdata", "miiid_jsonschema.json",
      package = "validamiiid"
    )
  )[["version"]]
}
