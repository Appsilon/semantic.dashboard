library(testthat)
library(semantic.dashboard)

test_check("semantic.dashboard")

for (col in paste0(semantic.dashboard:::ALLOWED_COLORS, "x")) {
  color <- col
  expect_success(expect_warning(semantic.dashboard:::verify_value_allowed("color", semantic.dashboard:::ALLOWED_COLORS)))
}
for (col in semantic.dashboard:::ALLOWED_COLORS) {
  color <- col
  expect_failure(expect_warning(semantic.dashboard:::verify_value_allowed("color", semantic.dashboard:::ALLOWED_COLORS)))
}
