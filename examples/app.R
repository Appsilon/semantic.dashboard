if(interactive()){

  library(shiny)
  library(semantic.dashboard)
  library(plotly)
  library(DT)

  ui <- dashboardPage(
    dashboardSidebar(side = "top", size = "thin", color = "teal",
                     uimenu_item("plot_tab", "My plot"),
                     uimenu_item("table_tab", "My table")),
    dashboardBody(uitab(id = "plot_tab", active = TRUE,
                        selectInput(inputId =  "variable1", choices = names(mtcars),
                                    label = "Select first variable", selected = "mpg"),
                        selectInput(inputId =  "variable2", choices = names(mtcars),
                                    label = "Select second variable", selected = "cyl"),
                        plotlyOutput("mtcars_plot")),
                  uitab(id = "table_tab",
                        dataTableOutput("mtcars_table")))
  )

  server <- function(input, output) {

    output$mtcars_plot <- renderPlotly(plot_ly(mtcars, x = ~ mtcars[ , input$variable1],
                                               y = ~ mtcars[ , input$variable2], width = "100%",
                                               type = "scatter", mode = "markers"))
    output$mtcars_table <- renderDataTable(mtcars)

    lapply(c("mtcars_plot", "mtcars_table"),
           function(x) outputOptions(output, x, suspendWhenHidden = FALSE))
  }

  shinyApp(ui, server)
}
