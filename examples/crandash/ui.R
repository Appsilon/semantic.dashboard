dashboardPage(title = "crandash-semantic",
              dashboardHeader(color = "blue"),
              dashboardSidebar(side = "left", size = "thin", color = "grey", center = TRUE,
                               sliderInput("rateThreshold", "Warn when rate exceeds",
                                           min = 0, max = 50, value = 3, step = 0.1
                               ),
                               menuItem("Dashboard", tabName = "dashboard"),
                               menuItem("Raw data", tabName = "rawdata")
              ),
              dashboardBody(
                tabItems(selected = 1,
                         tabItem(tabName = "dashboard",
                                 fluidRow(
                                   column(5, valueBoxOutput("rate")),
                                   column(5, valueBoxOutput("count")),
                                   column(5, valueBoxOutput("users"))
                                 ),
                                 fluidRow(
                                   column(width = 10,
                                          box(
                                            title = "Popularity by package (last 5 min)",
                                            color = "blue", ribbon = TRUE, title_side = "top right",
                                            bubblesOutput("packagePlot", width = "100%", height = 600)
                                          )),
                                   column(width = 6,
                                          box(
                                            title = "Top packages (last 5 min)",
                                            color = "blue", ribbon = TRUE, title_side = "top right",
                                            tableOutput("packageTable")
                                          ))
                                 )),
                         tabItem(tabName = "rawdata",
                                 fluidRow(
                                   numericInput("maxrows", "Rows to show", 25),
                                   verbatimTextOutput("rawtable"),
                                   downloadButton("downloadCsv", "Download as CSV"))
                         ))
              )
)


