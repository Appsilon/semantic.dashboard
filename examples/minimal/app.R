if(interactive()){

  library(shiny)
  library(semantic.dashboard)

  ui <- dashboardPage(
    dashboardHeader(color = "blue"),
    dashboardSidebar(side = "top", size = "thin", color = "teal",
                     menuItem("tab1", "Tab 1"),
                     menuItem("tab2", "Tab 2")),
    dashboardBody(tabItem(tabName = "tab1", active = TRUE, p("Tab 1")),
                  tabItem(tabName = "tab2", p("Tab 2")))
  )

  server <- function(input, output) {
  }

  shinyApp(ui, server)
}
