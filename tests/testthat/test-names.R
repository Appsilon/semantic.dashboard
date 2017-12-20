library(semantic.dashboard)
library(shinydashboard)
context("Function names")

test_that("Fucntion names from shinydashboard are identical to names from semantic.dashboard", {
  to_be_implemented <- c("menuItemOutput", "menuSubItem", "renderMenu", "sidebarMenuOutput",
                         "sidebarSearchForm", "sidebarUserPanel", "tabBox", "updateTabItems")
  not_implemented <- setdiff(setdiff(ls("package:shinydashboard"), ls("package:semantic.dashboard")),
                             to_be_implemented)
  expect_equal(length(not_implemented), 0)
}
)
