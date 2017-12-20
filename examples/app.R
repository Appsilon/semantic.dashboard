if(interactive()){

  library(shiny)
  library(shiny.semantic)
  library(semantic.dashboard)
  library(plotly)
  library(DT)

  ui <- dashboardPage(
    dashboardHeader(color = "blue",
                    dropdownMenu(messageItem("Michał", "Test message", color = "teal"),
                                 messageItem("Marek", "Another test!", icon = "warning", color = "red")),
                    dropdownMenu(type = "task", taskItem("Project progress...", 50.777, color = "red")),
                    dropdownMenu(type = "notifications", notificationItem("This is notification!", color = "red"))),
    dashboardSidebar(side = "left", size = "", color = "black",
                     sidebarMenu(
                       menuItem(tabName = "plot_tab", label = "My plot", icon = icon("home")),
                       menuItem(tabName = "table_tab", label = "My table", icon = icon("smile")))),
    dashboardBody(
      tabItems(
      tabItem(tabName = "plot_tab",
              fluidRow(
                valueBox("Unread Mail", 44, icon("mail"), color = "blue", width = 5)),
              fluidRow(
                box(title = "Sample box", color = "blue", width = 14,
                    selectInput(inputId =  "variable1", choices = names(mtcars),
                                label = "Select first variable", selected = "mpg"),
                    selectInput(inputId =  "variable2", choices = names(mtcars),
                                label = "Select second variable", selected = "cyl"),
                    plotlyOutput("mtcars_plot")))),
      tabItem(tabName = "table_tab",
              fluidRow(
                valueBox("Unread Mail", 144, icon("mail"), color = "blue", width = 6),
                valueBox("Spam", 20, icon("mail"), color = "red", width = 5),
                valueBox("Readed Mail", 666, icon("mail"), color = "green", width = 5)
              ),
              fluidRow(
                box(title = "Classic box", color = "red", ribbon = FALSE,
                    title_side = "top left", width = 14,
                    dataTableOutput("mtcars_table"),
                    dataTableOutput("mtcars_table2"),
                    dataTableOutput("mtcars_table3")
                )))))
  )

  server <- function(input, output) {

    output$mtcars_plot <- renderPlotly(plot_ly(mtcars, x = ~ mtcars[ , input$variable1],
                                               y = ~ mtcars[ , input$variable2], width = "100%",
                                               type = "scatter", mode = "markers"))
    output$mtcars_table <- renderDataTable(mtcars)
    output$mtcars_table2 <- renderDataTable(mtcars)
    output$mtcars_table3 <- renderDataTable(mtcars)

    lapply(c("mtcars_plot", "mtcars_table", "mtcars_table2", "mtcars_table3"),
           function(x) outputOptions(output, x, suspendWhenHidden = FALSE))
  }

  shinyApp(ui, server)
}
