## code to prepare `valid_example_miiid` dataset goes here
valid_example_miiid <- paste(
  readLines("data-raw/valid_example_miiid.yaml"),
  collapse = "\n"
)
usethis::use_data(valid_example_miiid, overwrite = TRUE)
