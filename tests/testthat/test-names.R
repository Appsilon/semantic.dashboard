library(semantic.dashboard)
library(shinydashboard)
context("Function names")

test_that("All functions from shinydashboard are implemented except functions known to be missing", { # nolint: line_length_linter
  to_be_implemented <- c(
    "menuItemOutput", "menuSubItem", "renderMenu", "sidebarMenuOutput",
    "sidebarSearchForm", "updateTabItems"
  )
  not_implemented <- setdiff(
    setdiff(ls("package:shinydashboard"), ls("package:semantic.dashboard")),
    to_be_implemented
  )
  expect_equal(length(not_implemented), 0)
})
