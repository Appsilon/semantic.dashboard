library(shiny)
library(semantic.dashboard)

ui <- dashboardPage(
  dashboardHeader(color = "blue"),
  dashboardSidebar(side = "left", size = "thin", color = "teal",
                   sidebarMenu(
                     menuItem(tabName = "tab1", "Tab 1"),
                     menuItem(tabName = "tab2", "Tab 2"))),
  dashboardBody(tabItems(
    tabItem(tabName = "tab1", p("Tab 1")),
    tabItem(tabName = "tab2", p("Tab 2"))))
)


server <- function(input, output) {
}

shinyApp(ui, server)
