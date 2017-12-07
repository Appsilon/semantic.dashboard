#' Create a header of a dashboard.
#' @description Create a header of a dashboard with other additional UI elements.
#' @param ... UI elements to include within the header.
#' @param  color Color of the sidebar. One of \code{c("red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @return A header that can be passed to \code{\link[semantic.dashboard]{dashboardPage}}
#' @export
dashboard_header <- function(..., color = "black"){
  shiny::div(class = paste("ui top attached inverted", color, "demo menu"),
             shiny::tags$a(class = "item", shiny::tags$i(class = "sidebar icon"), "Menu"), ...)
}

#' Create a header of a dashboard.
#' @description Create a header of a dashboard with other additional UI elements.
#' @param ... UI elements to include within the header.
#' @param  color Color of the sidebar. One of \code{c("red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @return A header that can be passed to \code{\link[semantic.dashboard]{dashboardPage}}
#' @export
#' @examples
#' if(interactive()){
#'
#'   library(shiny)
#'   library(semantic.dashboard)
#'
#'   ui <- dashboardPage(
#'     dashboardHeader(color = "blue"),
#'     dashboardSidebar(side = "top", size = "thin", color = "teal",
#'                      menuItem("tab1", "Tab 1"),
#'                      menuItem("tab2", "Tab 2")),
#'     dashboardBody(uitab(id = "tab1", active = TRUE, p("Tab 1")),
#'                   uitab(id = "tab2", p("Tab 2")))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboardHeader <- function(..., color = "black"){
  dashboard_header(..., color = color)
}

#' Create a sidebar of a dashboard.
#' @description Create a pushable sidebar of a dashboard with menu items and other additional UI elements.
#' @param ... UI elements to include within the sidebar.
#' @param  side Placement of the sidebar. One of \code{c("left", "right", "top", "bottom")}
#' @param  size Size of the sidebar. One of \code{c("", "thin", "very thin", "wide", "very wide")}
#' @param  color Color of the sidebar. One of \code{c("red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param  center Schould label and icon be centerd on menu items. Default to \code{FALSE}
#' @return A sidebar that can be passed to \code{\link[semantic.dashboard]{dashboardPage}}
#' @export

dashboard_sidebar <- function(..., side = "left", size = "", color = "black", center = FALSE){
  if (!(side %in% c("left", "right", "top", "bottom"))){
    warning("'side' argument should be one of 'left', 'right', 'top', 'bottom'")
  }
  if (!(size %in% c("", "thin", "very thin", "wide", "very wide"))){
    warning("'size' argument should be one of '', 'thin', 'very thin', 'wide', 'very wide'")
  }
  if (!(color %in% c("red", "orange", "yellow", "olive", "green", "teal",
                     "blue", "violet", "purple", "pink", "brown", "grey", "black"))){
    warning("'color' argument should be one of 'red', 'orange', 'yellow', 'olive', 'green', 'teal',
            'blue', 'violet', 'purple', 'pink', 'brown', 'grey', 'black'")
  }
  display_type <- ifelse(center, "labeled icon", "")
  shiny::div(id = "uisidebar",
             class = paste("ui", size, side, color, ifelse(side %in% c("top", "bottom"), "", "vertical"),
                           display_type, "inverted menu sidebar push"), ...)
}

#' Create a sidebar of a dashboard.
#' @description Create a pushable sidebar of a dashboard with menu items and other additional UI elements.
#' @param ... UI elements to include within the sidebar.
#' @param  side Placement of the sidebar. One of \code{c("left", "right", "top", "bottom")}
#' @param  size Size of the sidebar. One of \code{c("", "thin", "very thin", "wide", "very wide")}
#' @param  color Color of the sidebar. One of \code{c("red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param  center Schould label and icon be centerd on menu items. Default to \code{FALSE}
#' @return A sidebar that can be passed to \code{\link[semantic.dashboard]{dashboardPage}}
#' @export
#' @examples
#' if(interactive()){
#'
#'   library(shiny)
#'   library(semantic.dashboard)
#'
#'   ui <- dashboardPage(
#'     dashboardHeader(color = "blue"),
#'     dashboardSidebar(side = "top", size = "thin", color = "teal",
#'                      menuItem("tab1", "Tab 1"),
#'                      menuItem("tab2", "Tab 2")),
#'     dashboardBody(uitab(id = "tab1", active = TRUE, p("Tab 1")),
#'                   uitab(id = "tab2", p("Tab 2")))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboardSidebar <- function(..., side = "left", size = "", color = "black", center = FALSE){
  dashboard_sidebar(..., side = side, size = size, color = color, center = center)
}

#' Create a body of a dashboard.
#' @description Create a body of a dashboard with tabs and other additional UI elements.
#' @param ... UI elements to include within the body.
#' @return A tab that can be passed to \code{\link[semantic.dashboard]{dashboardPage}}
#' @export
dashboard_body <- function(...){
  shiny::div(class = "pusher", style = "height: 100%;",  ...)
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
#'
#'   ui <- dashboardPage(
#'     dashboardHeader(color = "blue"),
#'     dashboardSidebar(side = "top", size = "thin", color = "teal",
#'                      menuItem("tab1", "Tab 1"),
#'                      menuItem("tab2", "Tab 2")),
#'     dashboardBody(uitab(id = "tab1", active = TRUE, p("Tab 1")),
#'                   uitab(id = "tab2", p("Tab 2")))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboardBody <- function(...){
  dashboard_body(...)
}

sidebar_js <- "$('.sidebar.menu .item').tab({onVisible: function() {$(window).resize()} });
     $('.wrapper .ui.sidebar')
  .sidebar({
    context: $('.wrapper .pusher'),
    transition: 'push'
  })
  .sidebar('attach events', '.wrapper .menu .item')
;"

#' Create a dashboard.
#' @description Create a page with menu item sidebar and body containing tabs and other additional elements.
#' @param  dashboardHeader Header of a dashboard.
#' @param  dashboardSidebar Sidebar of a dashboard.
#' @param  dashboardBody Body of a dashboard.
#' @param  title Title of a dashboard.
#' @param suppress_bootstrap There are some conflicts in CSS styles between SemanticUI and Bootstrap. For the time being it's better to suppress Bootstrap. If \code{TRUE} bootstrap dependency from \code{shiny} will be disabled.
#' @return Dashboard.
#' @export
dashboard_page <- function(dashboardHeader, dashboardSidebar, dashboardBody, title = "", suppress_bootstrap = TRUE){
  # Line below will be removed when it will be added to semanticPage() function
  if (suppress_bootstrap) shiny::suppressDependencies("bootstrap")
  shiny.semantic::semanticPage(dashboardHeader, dashboardSidebar, dashboardBody,
                               shiny::tags$script(sidebar_js), title = title)
}

#' Create a dashboard.
#' @description Create a page with menu item sidebar and body containing tabs and other additional elements.
#' @param  dashboardHeader Header of a dashboard.
#' @param  dashboardSidebar Sidebar of a dashboard.
#' @param  dashboardBody Body of a dashboard.
#' @param  title Title of a dashboard.
#' @param suppress_bootstrap There are some conflicts in CSS styles between SemanticUI and Bootstrap. For the time being it's better to suppress Bootstrap. If \code{TRUE} bootstrap dependency from \code{shiny} will be disabled.
#' @return Dashboard.
#' @export
#' @examples
#' if(interactive()){
#'
#'   library(shiny)
#'   library(semantic.dashboard)
#'
#'   ui <- dashboardPage(
#'     dashboardSidebar(side = "top", size = "thin", color = "teal",
#'                      menuItem("tab1", "Tab 1"),
#'                      menuItem("tab2", "Tab 2")),
#'     dashboardBody(uitab(id = "tab1", active = TRUE, p("Tab 1")),
#'                   uitab(id = "tab2", p("Tab 2")))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboardPage <- function(dashboardHeader, dashboardSidebar, dashboardBody, title = "", suppress_bootstrap = TRUE){
  dashboard_page(dashboardHeader = dashboardHeader, dashboardSidebar = dashboardSidebar, dashboardBody = dashboardBody,
                 title = title, suppress_bootstrap = suppress_bootstrap)

}
