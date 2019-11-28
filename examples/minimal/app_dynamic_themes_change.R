library(shiny)
library(semantic.dashboard)
library(shiny.semantic)

ui <- tagList(
  dashboardPage(
    theme = NULL,
    dashboardHeader(color = "blue"),
    dashboardSidebar(
      side = "left",
      size = "thin",
      color = "teal",
      sidebarMenu(menuItem(tabName = "tab1", "Tab 1"))
    ),
    dashboardBody(tabItems(tabItem(
      tabName = "tab1",
      dropdown("themes_dropdown", shiny.semantic:::SUPPORTED_THEMES)
    )))
  ),
  tags$header(uiOutput("css"))
)


server <- function(input, output) {
  output$css <- renderUI({
    req(input$themes_dropdown)
    tags$link(
      rel = "stylesheet",
      type = "text/css",
      href = paste0(
        "https://d335w9rbwpvuxm.cloudfront.net/semantic.",
        input$themes_dropdown,
        ".min.css"
      )
    )
  })

}

shinyApp(ui, server)
