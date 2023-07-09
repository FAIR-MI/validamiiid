ex_yaml_pairwise <- paste(c(
  "participants:",
  "  - 'Phocaeicola alice'",
  "  - 'Phocaeicola bob'",
  "tax_id:",
  "  - 353",
  "  - 432"
), collapse = "\n")

test_that("YAML-to-JSON works", {
  expect_equal(
    yaml_to_json(""), "{}"
  )
  expect_equal(
    yaml_to_json(ex_yaml_pairwise),
    "{\"participants\":[\"Phocaeicola alice\",\"Phocaeicola bob\"],\"tax_id\":[353,432]}"
  )
})

ex_json_pairwise <- '{
  "participants": ["Phocaeicola alice","Phocaeicola bob"],
  "tax_id":[353,432]
}'
test_that("JSON-to-YAML works", {
  expect_equal(
    json_to_yaml(ex_json_pairwise),
    "participants:\n  - Phocaeicola alice\n  - Phocaeicola bob\ntax_id:\n  - 353\n  - 432\n"
  )
})
