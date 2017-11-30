library(shiny)
library(semantic.dashboard)

ui <- dashboardPage(
  dashboardSidebar(side = "top",
                  uimenu_item("a", "Tab 1"),
                  uimenu_item("b", "Tab 2"),
                  uimenu_item("c", "Tab 3")),
  dashboardBody(uitab(id = "a", active = TRUE,
                       numericInput("n1", "n", 50),
                       plotOutput("plot1"),
                       numericInput("n2", "n", 50),
                       plotOutput("plot2"),
                       numericInput("n3", "n", 50),
                       plotOutput("plot3")),
                 uitab(id = "b",
                       numericInput("n4", "nn", 50),
                       plotOutput("plot4")),
                 uitab(id = "c",
                       numericInput("n5", "nnn", 50),
                       plotOutput("plot5")))
)

server <- function(input, output) {

  randomVals1 <- reactive({
    runif(input$n1)
  })

  output$plot1 <- renderPlot({
    hist(randomVals1())
  })

  randomVals2 <- reactive({
    runif(input$n2)
  })

  output$plot2 <- renderPlot({
    hist(randomVals2())
  })

  randomVals3 <- reactive({
    runif(input$n3)
  })

  output$plot3 <- renderPlot({
    hist(randomVals3())
  })

  randomVals4 <- reactive({
    runif(input$n4)
  })

  output$plot4 <- renderPlot({
    hist(randomVals4())
  })

  randomVals5 <- reactive({
    runif(input$n5)
  })

  output$plot5 <- renderPlot({
    hist(randomVals5())
  })

  lapply(c("plot1", "plot2", "plot3", "plot4", "plot5"),
         function(x) outputOptions(output, x, suspendWhenHidden = FALSE))
}

shinyApp(ui, server)
