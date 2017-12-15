context("verify_value_allowed")

test_that("verify_value_allowed shows warning when value not in allowed", {
  checked_value <- "wrong_value"
  allowed_values <- c("good_value1", "good_value2")
  expect_warning(semantic.dashboard:::verify_value_allowed("checked_value", allowed_values))
})

test_that("verify_value_allowed does not show warning when value not in allowed", {
  checked_value <- "good_value"
  allowed_values <- c("another_good_value", checked_value)
  expect_silent(semantic.dashboard:::verify_value_allowed("checked_value", allowed_values))
})
