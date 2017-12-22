library(semantic.dashboard)
library(shinydashboard)
context("Function names")

test_that("All functions from shinydashboard are implemented except functions known to be missing", {
  to_be_implemented <- c("menuItemOutput", "menuSubItem", "renderMenu", "sidebarMenuOutput",
                         "sidebarSearchForm", "sidebarUserPanel", "updateTabItems")
  not_implemented <- setdiff(setdiff(ls("package:shinydashboard"), ls("package:semantic.dashboard")),
                             to_be_implemented)
  expect_equal(length(not_implemented), 0)
}
)
