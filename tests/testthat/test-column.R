context("column")

test_that("column works with doubles", {
  width <- 6.7
  expect_silent(semantic.dashboard::column(width = width))
})
