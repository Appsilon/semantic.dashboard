library(shiny)
library(semantic.dashboard)

ui <- dashboardPage(
  class = "stronka",
  sidebar_body_class = "sidebar_and_bodyyy",
  dashboardHeader(class = "headerek"),
  dashboardSidebar(
    class="sidebarek",
    visible = FALSE,
    closable = TRUE,
    pushable = TRUE,
    sidebarMenu(
      menuItem(tabName = "tab1", "Tab 1"),
      menuItem(tabName = "tab2", "Tab 2"))),
  dashboardBody(tabItems(
    tabItem(tabName = "tab1", p("Tab 1")),
    tabItem(tabName = "tab2", p("Tab 2"))),
    class="cialko")
)


server <- function(input, output) {
}

shinyApp(ui, server)
