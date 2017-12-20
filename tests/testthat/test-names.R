library(semantic.dashboard)
context("Function names")

test_that("Fucntion names from shinydashboard are identical to names from semantic.dashboard",
expect_equal(sum(!(c("box", "dashboardBody", "dashboardHeader", "dashboardPage",
                         "dashboardSidebar", "dropdownMenu", "dropdownMenuOutput", "infoBox",
                         "infoBoxOutput", "menuItem", "messageItem", "notificationItem",
                         "renderDropdownMenu", "renderInfoBox", "renderValueBox", "sidebarMenu",
                         "tabItem", "tabItems", "taskItem", "valueBox", "valueBoxOutput"
) %in% ls("package:semantic.dashboard"))), 0))
