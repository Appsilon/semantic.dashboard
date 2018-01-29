
<link href="http://fonts.googleapis.com/css?family=Maven+Pro:400,700|Inconsolata" rel="stylesheet" type="text/css"> <link href='docs/style.css' rel='stylesheet' type='text/css'>

semantic.dashboard
==================

Dashboard with Semantic UI Support for Shiny

Basic functions for creating dashboard with Semantic UI.

<!-- #Basic tutorial article is available on [Appsilon Data Science blog](your_future_art_link). -->
<!-- Live demo link below -->
<!--<p style="text-align: center; font-size: x-large;">
<a href="">Live demo</a>
</p> -->

Source code
-----------

This library source code can be found on [Appsilon Data Science's](http://appsilondatascience.com) Github: <br> <https://github.com/Appsilon/semantic.dashboard>

How to install?
---------------

**Note! This library is still in its infancy. Api might change in the future.**

At the moment it's possible to install this library through [devtools](https://github.com/hadley/devtools).

    devtools::install_github("Appsilon/semantic.dashboard")

To install [previous version]() you can run:

    devtools::install_github("Appsilon/semantic.dashboard", ref = "0.1.0")

Example
-------

    if(interactive()){

      library(shiny)
      library(shiny.semantic)
      library(semantic.dashboard)
      library(plotly)
      library(DT)

      ui <- dashboardPage(
        dashboardHeader(color = "",
                        dropdownMenuOutput("dropdown1"),
                        dropdownMenu(icon = icon("warning sign"), taskItem("Project progress...", 50.777, color = "red")),
                        dropdownMenu(type = "notifications", notificationItem("This is notification!", color = "red"))),
        dashboardSidebar(side = "left", size = "", color = "",
                         sidebarMenu(
                           menuItem(tabName = "plot_tab", text = "My plot", icon = icon("home")),
                           menuItem(tabName = "table_tab", text = "My table", icon = icon("smile")))),
        dashboardBody(
          tabItems(
            tabItem(tabName = "plot_tab",
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
                             tabs = list(
                               list(menu = "First Tab", content = "Some text..."),
                               list(menu = "Second Tab", content = plotlyOutput("mtcars_plot2"))
                             )))),
            tabItem(tabName = "table_tab",
                    fluidRow(
                      valueBox("Unread Mail", 144, icon("mail"), color = "blue", width = 6),
                      valueBox("Spam", 20, icon("mail"), color = "red", width = 5),
                      valueBox("Readed Mail", 666, icon("mail"), color = "green", width = 5)
                    ),
                    fluidRow(
                      box(title = "Classic box", color = "red", ribbon = FALSE,
                          title_side = "top left", width = 14,
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

        output$dropdown1 <- renderDropdownMenu({
          dropdownMenu(messageItem("Michał", "Test message", color = "teal"),
                       messageItem("Marek", "Another test!", icon = "warning", color = "red"))
        })
      }

      shinyApp(ui, server)
    }

How to contribute?
------------------

If you want to contribute to this project please submit a regular PR, once you're done with new feature or bug fix.<br>

**Changes in documentation**

Both repository **README.md** file and an official documentation page are generated with Rmarkdown, so if there is a need to update them, please modify accordingly a **README.Rmd** file and run a **build\_readme.R** script to compile it.

Troubleshooting
---------------

We used the latest versions of dependencies for this library, so please update your R environment before installation.

However, if you encounter any problems, try the following:

1.  Up-to-date R language environment
2.  Installing specific dependent libraries versions
    -   shiny.semantic

            devtools::install_github("Appsilon/shiny.semantic")

Future enhacements
------------------

-   CRAN release

Appsilon Data Science
---------------------

Get in touch [dev@appsilondatascience.com](dev@appsilondatascience.com)
