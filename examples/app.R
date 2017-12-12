if(interactive()){

  library(shiny)
  library(shiny.semantic)
  library(semantic.dashboard)
  library(plotly)
  library(DT)

  ui <- dashboardPage(
    dashboardHeader(color = "black"),
    dashboardSidebar(side = "left", size = "", color = "black", center = TRUE,
                     menuItem("plot_tab", label = "My plot", icon = icon("home")),
                     menuItem("table_tab", label = "My table", icon = icon("smile"))),
    dashboardBody(tabItem(tabName = "plot_tab", active = TRUE,
                          fluidRow(
                          valueBox("Unreaded Mail", 44, icon("mail"), color = "blue")),
                          fluidRow(
                          box(title = "Sample box", color = "blue",
                        selectInput(inputId =  "variable1", choices = names(mtcars),
                                    label = "Select first variable", selected = "mpg"),
                        selectInput(inputId =  "variable2", choices = names(mtcars),
                                    label = "Select second variable", selected = "cyl"),
                        plotlyOutput("mtcars_plot")))),
                  tabItem(tabName = "table_tab",
                          fluidRow(
                          valueBoxes(
                            valueBox("Unreaded Mail", 144, icon("mail"), color = "blue"),
                            valueBox("Spam", 20, icon("mail"), color = "red"),
                            valueBox("Readed Mail", 666, icon("mail"), color = "green")
                          )),
                          fluidRow(
                        box(title = "Classic box", color = "red", ribbon = FALSE, title_side = "top",
                            dataTableOutput("mtcars_table")))))
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
