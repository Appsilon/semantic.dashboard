#' Create a header of a dashboard (alias for \code{dashboard_header} for compatibility with \code{shinydashboard})
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
#'     dashboardBody(tabItem(tabName = "tab1", active = TRUE, p("Tab 1")),
#'                   tabItem(tabName = "tab2", p("Tab 2")))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboard_header <- function(..., color = "black"){
  verify_value_allowed("color", ALLOWED_COLORS)
  shiny::div(class = paste("ui top attached inverted", color, "demo menu"),
             shiny::tags$a(class = "item", shiny::tags$i(class = "sidebar icon"), "Menu"), ...)
}

#' @describeIn dashboard_header Create a header of a dashboard (alias for \code{dashboard_header} for compatibility with \code{shinydashboard})
#' @export
dashboardHeader <- dashboard_header


#' Create a sidebar of a dashboard (alias for \code{dashboard_sidebar} for compatibility with \code{shinydashboard})
#' @description Create a pushable sidebar of a dashboard with menu items and other additional UI elements.
#' @param ... UI elements to include within the sidebar.
#' @param  side Placement of the sidebar. One of \code{c("left", "right", "top", "bottom")}
#' @param  size Size of the sidebar. One of \code{c("", "thin", "very thin", "wide", "very wide")}
#' @param  color Color of the sidebar. One of \code{c("red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param  center Should label and icon be centerd on menu items. Default to \code{FALSE}
#' @param  visible Should sidebar be visible on start. Default to \code{TRUE}
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
#'     dashboardBody(tabItem(tabName = "tab1", active = TRUE, p("Tab 1")),
#'                   tabItem(tabName = "tab2", p("Tab 2")))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboard_sidebar <- function(..., side = "left", size = "", color = "black", center = FALSE, visible = TRUE){
  verify_value_allowed("side", ALLOWED_SIDEBAR_SIDES)
  verify_value_allowed("size", ALLOWED_SIDEBAR_SIZES)
  verify_value_allowed("color", ALLOWED_COLORS)
  display_type <- ifelse(center, "labeled icon", "")
  shiny::div(id = "uisidebar",
             class = paste("ui", size, side, color, ifelse(side %in% c("top", "bottom"), "", "vertical"),
                           display_type, ifelse(visible, "visible", ""), "inverted menu sidebar"), ...)
}

#' @describeIn dashboard_sidebar Create a sidebar of a dashboard (alias for \code{dashboard_sidebar} for compatibility with \code{shinydashboard})
#' @export
dashboardSidebar <- dashboard_sidebar


#' Create a body of a dashboard (alias for \code{dashboard_body} for compatibility with \code{shinydashboard})
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
#'     dashboardBody(tabItem(tabName = "tab1", active = TRUE, p("Tab 1")),
#'                   tabItem(tabName = "tab2", p("Tab 2")))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboard_body <- function(...){
  shiny::div(class = "pusher", style = "height: 100%;",
             shiny::div(class = "ui segment",
                        shiny::tags$div(class = "ui equal width grid", ...)))
}

#' @describeIn dashboard_body Create a body of a dashboard (alias for \code{dashboard_body} for compatibility with \code{shinydashboard})
#' @export
dashboardBody <- dashboard_body

#' Create a dashboard (alias for \code{dashboard_page} for compatibility with \code{shinydashboard})
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
#'     dashboardBody(tabItem(tabName = "tab1", active = TRUE, p("Tab 1")),
#'                   tabItem(tabName = "tab2", p("Tab 2")))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboard_page <- function(dashboardHeader, dashboardSidebar, dashboardBody, title = "", suppress_bootstrap = TRUE){
  # TODO: Remove this line when it is added to semanticPage()
  if (suppress_bootstrap) shiny::suppressDependencies("bootstrap")
  shiny.semantic::semanticPage(dashboardHeader, dashboardSidebar, dashboardBody,
                               shiny::tags$script(sidebar_js), title = title)
}

#' @describeIn dashboard_page Create a dashboard (alias for \code{dashboard_page} for compatibility with \code{shinydashboard})
#' @export
dashboardPage <- dashboard_page
