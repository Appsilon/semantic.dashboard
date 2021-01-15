context("utils")

library(shiny)

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

test_that("test get_inverted_class", {
  expect_equal(get_inverted_class(TRUE), "inverted")
  expect_equal(get_inverted_class(FALSE), "")
})

test_that("test interlace_dividers", {
  list_divs_with_dividers <- interlace_dividers(tagList(div("a"), div("b")))
  expect_length(list_divs_with_dividers, 3)
})

test_that("test random_id_generator", {
  id1 <- random_id_generator()
  id2 <- random_id_generator()
  expect_false(id1 == id2)
  expect_true(nchar(random_id_generator(id_length = 3)) == 3)
})

