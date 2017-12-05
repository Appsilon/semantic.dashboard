if(interactive()){

  library(shiny)
  library(shiny.semantic)
  library(semantic.dashboard)
  library(plotly)
  library(DT)

  ui <- dashboardPage(
    dashboardHeader(color = "black"),
    dashboardSidebar(side = "left", size = "thin", color = "black", type = "labeled icon",
                     uimenu_item("plot_tab", label = "My plot", icon = uiicon("home")),
                     uimenu_item("table_tab", label = "My table", icon = uiicon("smile"))),
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
