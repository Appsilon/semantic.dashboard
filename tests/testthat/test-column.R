context("column")

test_that("column accepts widths of type double without warnings", {
  width <- 6.7
  expect_silent(semantic.dashboard::column(width = width))
})

test_that("column don't accept widths smaller than 1", {
  width <- 0
  expect_error(semantic.dashboard::column(width = width))
})

test_that("column don't accept widths greater than 16", {
  width <- 44
  expect_error(semantic.dashboard::column(width = width))
})

test_that("column don't accept not numeric widths", {
  width <- "a"
  expect_error(semantic.dashboard::column(width = width))
})

test_that("column returns a correct object", {
  width <- 5
  expect_identical(semantic.dashboard::column(width = width),
                   shiny::tags$div(class = "five wide column"))
})
