#' Create a sidebar of a dashboard.
#'
#' @param ... UI elements to include within the sidebar.
#' @param  side Placement of the sidebar. One of \code{c("left", "right", "top", "bottom")}
#' @param  size Size of the sidebar. One of \code{c("", "thin", "very thin", "wide", "very wide")}
#' @param  color Color of the sidebar.
#' @return A sidebar that can be passed to \code{dashboardPage}
#' @examples
#' dashboardSidebar(side = "top",
#' uimenu_item("a", "Tab 1"),
#' uimenu_item("b", "Tab 2"),
#' uimenu_item("c", "Tab 3"))
dashboardSidebar <- function(..., side = "left", size = "", color = "black"){
  shiny::div(id = "uisidebar", class = paste("ui", size, side, color, ifelse(side %in% c("top", "bottom"), "", "vertical"), "inverted menu sidebar push"), ...)
}

#' Create a body of a dashboard.
#'
#' @param ... UI elements to include within the pusher.
#' @return A tab that can be passed to \code{semanticDashboard}
#' @examples
#' dashboardDoby(uitab(id = "a", active = TRUE,
#'   numericInput("n1", "n", 50),
#'   plotOutput("plot1"),
#'   numericInput("n2", "n", 50),
#'   plotOutput("plot2"),
#'   numericInput("n3", "n", 50),
#'   plotOutput("plot3")),
#'   uitab(id = "b",
#'         numericInput("n4", "nn", 50),
#'         plotOutput("plot4")),
#'   uitab(id = "c",
#'         numericInput("n5", "nnn", 50),
#'         plotOutput("plot5")))
dashboardBody <- function(...){
  shiny::div(class="pusher", style = "height: 100%;",  ...)
}

#' Create a dashboard.
#'
#' @param  dashboardSidebar Sidebar of a dashboard.
#' @param  dashboardBody Body of a dashboard.
#' @param  title Title of a dashboard.
#' @param supress_bootsrtap If \code{TRUE} bootstrap dependency from \code{shiny} will be disabled.
#' @return Dashboard.
#' @examples
#' dashboardPage(
#'  dashboardSidebar(side = "top",
#'  uimenu_item("a", "Tab 1"),
#'  uimenu_item("b", "Tab 2"),
#'  uimenu_item("c", "Tab 3")),
#' dashboardBody(uitab(id = "a", active = TRUE,
#'   numericInput("n1", "n", 50),
#'   plotOutput("plot1"),
#'   numericInput("n2", "n", 50),
#'   plotOutput("plot2"),
#'   numericInput("n3", "n", 50),
#'   plotOutput("plot3")),
#'   uitab(id = "b",
#'         numericInput("n4", "nn", 50),
#'         plotOutput("plot4")),
#'   uitab(id = "c",
#'         numericInput("n5", "nnn", 50),
#'         plotOutput("plot5")))
#'         )
dashboardPage <- function(dashboardSidebar, dashboardBody, title = "", supress_bootsrtap = TRUE){
  if(supress_bootsrtap) {shiny::suppressDependencies("bootstrap")}
  content <- shiny::tags$div(class = "wrapper", shiny::div(class = "ui top attached demo menu",
                                                           shiny::tags$a(class = "item", shiny::tags$i(class = "sidebar icon"), "Menu")),
                             dashboardSidebar, dashboardBody)
  shiny::tagList(shiny.semantic:::get_dependencies(), shiny::tags$head(shiny::tags$title(title)),
                 shiny::tags$body(style = "min-height: 611px;", content, shiny::tags$script("$('.sidebar.menu .item').tab({onVisible: function() {$(window).resize()} });
                                                                                            $('.wrapper .ui.sidebar')
  .sidebar({
    context: $('.wrapper .pusher'),
    transition: 'push'
  })
  .sidebar('attach events', '.wrapper .menu .item')
;")))
}
