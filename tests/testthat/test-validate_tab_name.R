context("validate_tab_name")

test_that("validate_tab_name stops on name containing dot character", {
  checked_value <- "wrong.name"
  expect_error(semantic.dashboard:::validate_tab_name(checked_value))
})

test_that("validate_tab_name should not stop on correct name", {
  checked_value <- "good_name"
  expect_silent(semantic.dashboard:::validate_tab_name(checked_value))
})
