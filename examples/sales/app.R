library(shiny)
require(semantic.dashboard)
library(ggplot2)
library(dplyr)
recommendation <- read.csv('recommendation.csv', stringsAsFactors = FALSE, header = TRUE)

# Dashboard header carrying the title of the dashboard
header <- dashboardHeader()
# Sidebar content of the dashboard
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("bar chart")),
    menuItem(text = "Visit-us", href = "https://www.appsilondatascience.com", icon = icon("at")))
)

frow1 <- fluidRow(
  valueBoxOutput("value1"),
  valueBoxOutput("value2"),
  valueBoxOutput("value3")
)
frow2 <- fluidRow(
  box(
    title = "Revenue per Account",
    color = "blue",
    ribbon = TRUE,
    collapsible = TRUE,
    width = 8,
    plotOutput("revenuebyPrd", height = "300px")
  ),
  box(
    title = "Revenue per Product",
    color = "blue",
    ribbon = TRUE,
    collapsible = TRUE,
    width = 8,
    plotOutput("revenuebyRegion", height = "300px")
  )
)
# combine the two fluid rows to make the body
body <- dashboardBody(title = "Basic Dashboard", frow1, frow2)

ui <- dashboardPage(title = 'This is my Page title',
                    header, sidebar, body)

# create the server functions for the dashboard
server <- function(input, output, session) {
  #some data manipulation to derive the values of KPI boxes
  total.revenue <- sum(recommendation$Revenue)
  sales.account <- recommendation %>% group_by(Account) %>%
    summarise(value = sum(Revenue)) %>% filter(value == max(value))
  prof.prod <- recommendation %>% group_by(Product) %>%
    summarise(value = sum(Revenue)) %>% filter(value == max(value))
  #creating the valueBoxOutput content
  output$value1 <- renderValueBox({
    valueBox(
      value = formatC(sales.account$value, format="d", big.mark=','),
      subtitle = paste('Top Account:', sales.account$Account),
      icon = icon("bar chart"),
      color = "purple",
      width = 5)
  })
  output$value2 <- renderValueBox({
    valueBox(
      value = formatC(total.revenue, format = "d", big.mark = ','),
      subtitle = 'Total Expected Revenue',
      icon = icon("line chart"),
      color = "green",
      width = 5)
  })
  output$value3 <- renderValueBox({
    valueBox(
      value = formatC(prof.prod$value, format = "d", big.mark = ','),
      subtitle = paste('Top Product:', prof.prod$Product),
      icon = icon("bar chart"),
      color = "blue",
      width = 5)
  })
  #creating the plotOutput content
  output$revenuebyPrd <- renderPlot({
    ggplot(data = recommendation,
           aes( x= Product, y = Revenue, fill = factor(Region))) +
      geom_bar(position = "dodge", stat = "identity") + ylab("Revenue (in Euros)") +
      xlab("Product") + theme(legend.position="bottom",
                              plot.title = element_text(size = 15, face = "bold")) +
      ggtitle("Revenue by Product") + labs(fill = "Region")
  })
  output$revenuebyRegion <- renderPlot({
    ggplot(data = recommendation,
           aes(x = Account, y = Revenue, fill = factor(Region))) +
      geom_bar(position = "dodge", stat = "identity") + ylab("Revenue (in Euros)") +
      xlab("Account") + theme(legend.position="bottom",
                              plot.title = element_text(size = 15, face = "bold")) +
      ggtitle("Revenue by Region") + labs(fill = "Region")
  })
}

shinyApp(ui, server)
