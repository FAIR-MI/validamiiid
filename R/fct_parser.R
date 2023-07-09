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
  return(errors_df[, c("instancePath", "message")])
}
