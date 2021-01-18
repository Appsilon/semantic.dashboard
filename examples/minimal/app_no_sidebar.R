library(shiny)
library(semantic.dashboard)

ui <- dashboardPage(
  dashboardHeader(color = "blue"),
  dashboardSidebar(),
  dashboardBody(tabItems(
    tabItem(tabName = "tab1", p("Tab 1")),
    tabItem(tabName = "tab2", p("Tab 2"))))
)

server <- function(input, output) {
}

shinyApp(ui, server)
