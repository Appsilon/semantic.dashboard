if(interactive()){

  library(shiny)
  library(semantic.dashboard)

  ui <- dashboardPage(
    dashboardHeader(color = "blue"),
    dashboardSidebar(side = "top", size = "thin", color = "teal",
                     uimenu_item("tab1", "Tab 1"),
                     uimenu_item("tab2", "Tab 2")),
    dashboardBody(uitab(id = "tab1", active = TRUE, p("Tab 1")),
                  uitab(id = "tab2", p("Tab 2")))
  )

  server <- function(input, output) {
  }

  shinyApp(ui, server)
}
