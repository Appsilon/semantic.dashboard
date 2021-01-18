library(shiny)
library(semantic.dashboard)

ui <- dashboardPage(
  class = "my_page",
  sidebar_and_body_container_class = "my_sidebar_and_body",
  dashboardHeader(class = "my_header"),
  dashboardSidebar(
    class="my_sidebar",
    visible = FALSE,
    closable = TRUE,
    pushable = TRUE,
    sidebarMenu(
      menuItem(tabName = "tab1", "Tab 1"),
      menuItem(tabName = "tab2", "Tab 2"))),
  dashboardBody(tabItems(
    tabItem(tabName = "tab1", p("Tab 1")),
    tabItem(tabName = "tab2", p("Tab 2"))),
    class="my_body")
)


server <- function(input, output) {
}

shinyApp(ui, server)
