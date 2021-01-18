library(shiny)
library(semantic.dashboard)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    sidebarMenu( id= "sidebar_tabs",
                 menuItem("tab1", tabName = "tab1"),
                 menuItem("tab2", tabName = "tab2"),
                 conditionalPanel(
                   condition = "input.sidebar_tabs == 'tab2'",
                   div(class = "tab2-condition-panel", "tab2 div")
                 )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "tab1", p("Tab 1")),
      tabItem(tabName = "tab2", p("Tab 2"))
    )
  )
)

server <- function(input, output) {
  observe({
    print(input$sidebar_tabs)
  })
}

shinyApp(ui, server)
