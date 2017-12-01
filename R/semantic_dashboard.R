#' Add dashboard dependencies to html
#'
#' Internal function that adds dashboard dependencies to html.
#'
#' @return Content with appended dependencies.
get_dependencies <- function() {
  if (getOption("shiny.minified", TRUE)) {
    javascript_file <- "semantic.min.js"
    css_files <- c("semantic.min.css")
  } else {
    javascript_file <- "semantic.js"
    css_files <- c("semantic.css")
  }

  file <- system.file("semantic", package = "shiny.semantic")
  shiny::tagList(
    htmltools::htmlDependency("semantic-ui",
                              "2.1.8",
                              c(file = file),
                              script = javascript_file,
                              stylesheet = css_files
    )
  )
}

#' Create a sidebar of a dashboard.
#' @description Create a pushable sidebar of a dashboard with menu items and other additional UI elements.
#' @param ... UI elements to include within the sidebar.
#' @param  side Placement of the sidebar. One of \code{c("left", "right", "top", "bottom")}
#' @param  size Size of the sidebar. One of \code{c("", "thin", "very thin", "wide", "very wide")}
#' @param  color Color of the sidebar. One of \code{c("red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @return A sidebar that can be passed to \code{\link[semantic.dashboard]{dashboardPage}}
#' @export
#' @examples
#' if(interactive()){
#'
#'   library(shiny)
#'   library(semantic.dashboard)
#'   library(plotly)
#'   library(DT)
#'
#'   ui <- dashboardPage(
#'     dashboardSidebar(side = "top", size = "thin", color = "teal",
#'                      uimenu_item("plot_tab", "My plot"),
#'                      uimenu_item("table_tab", "My table")),
#'     dashboardBody(uitab(id = "plot_tab", active = TRUE,
#'                         selectInput(inputId =  "variable1", choices = names(mtcars),
#'                                     label = "Select first variable", selected = "mpg"),
#'                         selectInput(inputId =  "variable2", choices = names(mtcars),
#'                                     label = "Select second variable", selected = "cyl"),
#'                         plotlyOutput("mtcars_plot")),
#'                   uitab(id = "table_tab",
#'                         dataTableOutput("mtcars_table")))
#'   )
#'
#'   server <- function(input, output) {
#'
#'     output$mtcars_plot <- renderPlotly(plot_ly(mtcars, x=~mtcars[ , input$variable1], y=~mtcars[ , input$variable2], width = "100%"))
#'     output$mtcars_table <- renderDataTable(mtcars)
#'
#'     lapply(c("mtcars_plot", "mtcars_table"),
#'            function(x) outputOptions(output, x, suspendWhenHidden = FALSE))
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboardSidebar <- function(..., side = "left", size = "", color = "black"){
  if(!(side %in% c("left", "right", "top", "bottom"))){
    warning("'side' argument should be one of 'left', 'right', 'top', 'bottom'")
  }
  if(!(size %in% c("", "thin", "very thin", "wide", "very wide"))){
    warning("'size' argument should be one of '', 'thin', 'very thin', 'wide', 'very wide'")
  }
  if(!(color %in% c("red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black"))){
    warning("'color' argument should be one of 'red', 'orange', 'yellow', 'olive', 'green', 'teal', 'blue', 'violet', 'purple', 'pink', 'brown', 'grey', 'black'")
  }
  shiny::div(id = "uisidebar", class = paste("ui", size, side, color, ifelse(side %in% c("top", "bottom"), "", "vertical"), "inverted menu sidebar push"), ...)
}

#' Create a body of a dashboard.
#' @description Create a body of a dashboard with tabs and other additional UI elements.
#' @param ... UI elements to include within the body.
#' @return A tab that can be passed to \code{\link[semantic.dashboard]{dashboardPage}}
#' @export
#' @examples
#' if(interactive()){
#'
#'   library(shiny)
#'   library(semantic.dashboard)
#'   library(plotly)
#'   library(DT)
#'
#'   ui <- dashboardPage(
#'     dashboardSidebar(side = "top", size = "thin", color = "teal",
#'                      uimenu_item("plot_tab", "My plot"),
#'                      uimenu_item("table_tab", "My table")),
#'     dashboardBody(uitab(id = "plot_tab", active = TRUE,
#'                         selectInput(inputId =  "variable1", choices = names(mtcars),
#'                                     label = "Select first variable", selected = "mpg"),
#'                         selectInput(inputId =  "variable2", choices = names(mtcars),
#'                                     label = "Select second variable", selected = "cyl"),
#'                         plotlyOutput("mtcars_plot")),
#'                   uitab(id = "table_tab",
#'                         dataTableOutput("mtcars_table")))
#'   )
#'
#'   server <- function(input, output) {
#'
#'     output$mtcars_plot <- renderPlotly(plot_ly(mtcars, x=~mtcars[ , input$variable1], y=~mtcars[ , input$variable2], width = "100%"))
#'     output$mtcars_table <- renderDataTable(mtcars)
#'
#'     lapply(c("mtcars_plot", "mtcars_table"),
#'            function(x) outputOptions(output, x, suspendWhenHidden = FALSE))
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboardBody <- function(...){
  shiny::div(class = "pusher", style = "height: 100%;",  ...)
}

#' Create a dashboard.
#' @description Create a page with menu item sidebar and body containing tabs and other additional elements.
#' @param  dashboardSidebar Sidebar of a dashboard.
#' @param  dashboardBody Body of a dashboard.
#' @param  title Title of a dashboard.
#' @param suppress_bootsrtap There are some conflicts in CSS styles between SemanticUI and Bootstrap. For the time being it's better to suppress Bootstrap. If \code{TRUE} bootstrap dependency from \code{shiny} will be disabled.
#' @return Dashboard.
#' @export
#' @examples
#' if(interactive()){
#'
#'   library(shiny)
#'   library(semantic.dashboard)
#'   library(plotly)
#'   library(DT)
#'
#'   ui <- dashboardPage(
#'     dashboardSidebar(side = "top", size = "thin", color = "teal",
#'                      uimenu_item("plot_tab", "My plot"),
#'                      uimenu_item("table_tab", "My table")),
#'     dashboardBody(uitab(id = "plot_tab", active = TRUE,
#'                         selectInput(inputId =  "variable1", choices = names(mtcars),
#'                                     label = "Select first variable", selected = "mpg"),
#'                         selectInput(inputId =  "variable2", choices = names(mtcars),
#'                                     label = "Select second variable", selected = "cyl"),
#'                         plotlyOutput("mtcars_plot")),
#'                   uitab(id = "table_tab",
#'                         dataTableOutput("mtcars_table")))
#'   )
#'
#'   server <- function(input, output) {
#'
#'     output$mtcars_plot <- renderPlotly(plot_ly(mtcars, x=~mtcars[ , input$variable1], y=~mtcars[ , input$variable2], width = "100%"))
#'     output$mtcars_table <- renderDataTable(mtcars)
#'
#'     lapply(c("mtcars_plot", "mtcars_table"),
#'            function(x) outputOptions(output, x, suspendWhenHidden = FALSE))
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboardPage <- function(dashboardSidebar, dashboardBody, title = "", suppress_bootsrtap = TRUE){
  if(suppress_bootsrtap) {shiny::suppressDependencies("bootstrap")}
  content <- shiny::tags$div(class = "wrapper", shiny::div(class = "ui top attached demo menu",
                                                           shiny::tags$a(class = "item", shiny::tags$i(class = "sidebar icon"), "Menu")),
                             dashboardSidebar, dashboardBody)
  shiny::tagList(get_dependencies(), shiny::tags$head(shiny::tags$title(title)),
                 shiny::tags$body(style = "min-height: 611px;", content, shiny::tags$script("$('.sidebar.menu .item').tab({onVisible: function() {$(window).resize()} });
                                                                                            $('.wrapper .ui.sidebar')
  .sidebar({
    context: $('.wrapper .pusher'),
    transition: 'push'
  })
  .sidebar('attach events', '.wrapper .menu .item')
;")))
}
