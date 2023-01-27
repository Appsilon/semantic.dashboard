library(shiny)
library(shiny.semantic)
library(semantic.dashboard)
library(plotly)
library(DT)

ui <- dashboardPage(
  margin = TRUE,
  dashboardHeader(logo_align = "center",
                  logo_path = "http://d2v95fjda94ghc.cloudfront.net/appsilon_logo.png",
                  dropdownMenuOutput("dropdown"),
                  title = "Appsilon",
                  titleWidth = "thin",
                  show_menu_button = TRUE,
                  dropdownMenu(type = "notifications",
                               taskItem("Project progress...", 50.777, color = "red")),
                  dropdownMenu(icon = icon("red warning sign"),
                               notificationItem("This is an important notification!", color = "red"))),

  dashboardSidebar(side = "left",
                  size = "thin",
                  overlay = FALSE,
                  pushable = TRUE,
                  visible = TRUE,
                  dim_page = FALSE,
                  closable = FALSE,
                  sidebarMenu(
                      sidebarUserPanel(
                      "Jane Smith",
                      subtitle = a(href = "#", icon("circle"), "Online"),
                      # Original image is published with a free to use license.
                      # https://www.pexels.com/photo/3492736/
                      image = "jane_smith.jpg",
                      image_size = "mini"
                    ),
                    menuItem(tabName = "plot_tab", text = "My plot", icon = icon("home")),
                    menuItem(tabName = "table_tab", text = "My table", icon = icon("smile")))),

  dashboardBody(
    tabItems(
      tabItem(tabName = "plot_tab", fluid = TRUE,
              fluidRow(
                valueBox("Unread Mail", 44, icon("mail"), color = "blue", width = 5)),
              fluidRow(
                box(title = "Sample box", color = "blue", width = 11,
                    selectInput(inputId =  "variable1", choices = names(mtcars),
                                label = "Select first variable", selected = "mpg"),
                    selectInput(inputId =  "variable2", choices = names(mtcars),
                                label = "Select second variable", selected = "cyl"),
                    plotlyOutput("mtcars_plot")),
                tabBox(title = "Sample box", color = "blue", width = 5,
                       collapsible = FALSE,
                       tabs = list(
                         list(menu = "First Tab", content = "Some text..."),
                         list(menu = "Second Tab", content = plotlyOutput("mtcars_plot2"))
                       )))
              ),
      tabItem(tabName = "table_tab", fluid = FALSE,
              fluidRow(
                valueBox("Unread Mail", 144, icon("mail"), color = "blue", width = 6, size = "small"),
                valueBox("Spam", 20, icon("mail"), color = "red", width = 5, size = "small"),
                valueBox("Readed Mail", 666, icon("mail"), color = "green", width = 5, size = "small")
              ),
              fluidRow(
                box(title = "Classic box", color = "red", ribbon = FALSE,
                    title_side = "top left", width = 16,
                    dataTableOutput("mtcars_table")
                )))))
)

server <- function(input, output) {

  output$mtcars_plot <- renderPlotly(plot_ly(mtcars, x = ~ mtcars[ , input$variable1],
                                             y = ~ mtcars[ , input$variable2],
                                             type = "scatter", mode = "markers"))
  output$mtcars_plot2 <- renderPlotly(plot_ly(mtcars, x = ~ mtcars[ , input$variable1],
                                              y = ~ mtcars[ , input$variable2],
                                              type = "scatter", mode = "markers"))
  output$mtcars_table <- renderDataTable(mtcars)

  output$dropdown <- renderDropdownMenu({
    dropdownMenu(messageItem("User", "Test message", color = "teal", style = "min-width: 200px"),
                 messageItem("Users", "Test message", color = "teal", icon = "users"),
                 messageItem("See this", "Another test", icon = "warning", color = "red"))
  })
}

shinyApp(ui, server)
