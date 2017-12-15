library(testthat)
library(semantic.dashboard)

test_check("semantic.dashboard")

for (col in paste0(ALLOWED_COLORS, "x")) {
  color <- col
  expect_success(expect_warning(verify_value_allowed("color", ALLOWED_COLORS)))
}
for (col in ALLOWED_COLORS) {
  color <- col
  expect_failure(expect_warning(verify_value_allowed("color", ALLOWED_COLORS)))
}
