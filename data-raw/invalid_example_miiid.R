## code to prepare `invalid_example_miiid` dataset goes here
invalid_example_miiid <- paste(
  readLines("data-raw/invalid_example_miiid.yaml"),
  collapse = "\n"
)
usethis::use_data(invalid_example_miiid, overwrite = TRUE)
