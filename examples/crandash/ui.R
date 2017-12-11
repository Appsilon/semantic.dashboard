dashboardPage(title = "crandash-semantic",
              dashboardHeader(color = "blue"),
              dashboardSidebar(side = "left", size = "thin", color = "black", center = TRUE,
                               sliderInput("rateThreshold", "Warn when rate exceeds",
                                           min = 0, max = 50, value = 3, step = 0.1
                               ),
                               menuItem("Dashboard", tabName = "dashboard"),
                               menuItem("Raw data", tabName = "rawdata")
              ),
              dashboardBody(
                tabItem(tabName = "dashboard", active = TRUE,
                        fluidRow(
                          column(5, valueBox("Unreaded Mail", 144, icon("mail"), color = "blue")),
                          column(5, valueBox("Spam", 20, icon("mail"), color = "red")),
                                 column(5, valueBox("Readed Mail", 666, icon("mail"), color = "green"))),
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
                )
              )
)


