dashboardPage(title = "crandash-semantic",
              dashboardHeader(color = "blue"),
              dashboardSidebar(side = "left", size = "thin", color = "blue", center = TRUE,
                               sliderInput("rateThreshold", "Warn when rate exceeds",
                                           min = 0, max = 50, value = 3, step = 0.1
                               ),
                               menuItem("Dashboard", tabName = "dashboard"),
                               menuItem("Raw data", tabName = "rawdata")
              ),
              dashboardBody(
                tabItem(tabName = "dashboard", active = TRUE,
                        valueBoxes(
                          valueBox("Unreaded Mail", 144, icon("mail"), color = "blue"),
                          valueBox("Spam", 20, icon("mail"), color = "red"),
                          valueBox("Readed Mail", 666, icon("mail"), color = "green")
                        ),
                        shiny::tags$div(class = "ui relaxed grid",
                                        shiny::tags$div(class = "sixteen wide column row",
                                                        shiny::tags$div(class = "ten wide column",
                                                        box(
                                                          title = "Popularity by package (last 5 min)",
                                                          color = "blue", ribbon = TRUE, title_side = "top right",
                                                          bubblesOutput("packagePlot", width = "100%", height = 600)
                                                        )),
                                                        shiny::tags$div(class = "six wide column",
                                                        box(
                                                          title = "Top packages (last 5 min)",
                                                          color = "blue", ribbon = TRUE, title_side = "top right",
                                                          tableOutput("packageTable")
                                                        ))
                                        ))),
                tabItem(tabName = "rawdata",
                        numericInput("maxrows", "Rows to show", 25),
                        verbatimTextOutput("rawtable"),
                        downloadButton("downloadCsv", "Download as CSV")
                )
              )
)


