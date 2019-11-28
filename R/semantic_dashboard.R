#' semantic.dashboard
#'
#' @name semantic.dashboard
#' @import htmltools
#' @import glue
NULL

#' Create a header of a dashboard.
#' @description Create a header of a dashboard with other additional UI elements.
#' @param ... UI elements to include within the header.
#' @param  logo_align Where should logo be placed. One of \code{c("left", "center")}
#' @param  logo_path Path or URL of the logo to be shown in the header.
#' @param  color Color of the sidebar / text / icons (depending on the value of `inverted` parameter. \
#'   One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param inverted If FALSE sidebar will be white and text will be colored. \
#'   If TRUE text will be white and background will be colored. Default is \code{FALSE}.
#' @param disable If \code{TRUE}, don't display the header.
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
#'     dashboardSidebar(side = "left", size = "thin", color = "teal",
#'                      sidebarMenu(
#'                        menuItem(tabName = "tab1", "Tab 1"),
#'                        menuItem(tabName = "tab2", "Tab 2"))),
#'     dashboardBody(tabItems(
#'       tabItem(tabName = "tab1", p("Tab 1")),
#'       tabItem(tabName = "tab2", p("Tab 2"))))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboard_header <- function(..., logo_align = "center", logo_path = "",
                             color = "", inverted = FALSE, disable = FALSE){
  if (disable){
    NULL
  } else {
    verify_value_allowed("color", ALLOWED_COLORS)

    inverted_value <- get_inverted_class(inverted)
    logo_align_css_style <- ifelse(logo_align == "center", "margin-left: auto;", "")

    shiny::div(class = paste("ui top attached", inverted_value, color, " menu"),
               shiny::tags$a(id = "toggle_menu", class = "item",
                             shiny::tags$i(class = "sidebar icon"),
                             "Menu"),
               if (logo_path != "") shiny::tags$img(style = paste("height: 30px; margin: 5px;",
                                                                  logo_align_css_style), src = logo_path),
               shiny::div(class = "right icon menu", ...)
    )
  }
}

#' @describeIn dashboard_header Create a header of a dashboard (alias for \code{dashboard_header} for compatibility with \code{shinydashboard})
#' @export
dashboardHeader <- dashboard_header


#' Create a sidebar of a dashboard.
#' @description Create a pushable sidebar of a dashboard with menu items and other additional UI elements.
#' @param ... UI elements to include within the sidebar.
#' @param  side Placement of the sidebar. One of \code{c("left", "right", "top", "bottom")}
#' @param  size Size of the sidebar. One of \code{c("", "thin", "very thin", "wide", "very wide")}
#' @param  color Color of the sidebar / text / icons (depending on the value of `inverted` parameter. \
#'   One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param inverted If FALSE sidebar will be white and text will be colored. \
#'   If TRUE text will be white and background will be colored. Default is \code{FALSE}.
#' @param  center Should label and icon be centerd on menu items. Default to \code{FALSE}
#' @param  visible Should sidebar be visible on start. Default to \code{TRUE}
#' @param disable If \code{TRUE}, don't display the sidebar.
#' @param closable If \code{TRUE} allow close sidebar by clicking in the body. Default to \code{FALSE}
#' @param pushable If \code{TRUE} the menu button is active. Default to \code{TRUE}
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
#'     dashboardSidebar(side = "left", size = "thin", color = "teal",
#'                      sidebarMenu(
#'                        menuItem(tabName = "tab1", "Tab 1"),
#'                        menuItem(tabName = "tab2", "Tab 2"))),
#'     dashboardBody(tabItems(
#'       tabItem(tabName = "tab1", p("Tab 1")),
#'       tabItem(tabName = "tab2", p("Tab 2"))))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboard_sidebar <- function(..., side = "left", size = "thin", color = "", inverted = FALSE,
                              closable = FALSE, pushable = TRUE, center = FALSE, visible = TRUE,
                              disable = FALSE){
  if (disable) {
    NULL
  } else {
    verify_value_allowed("side", ALLOWED_SIDEBAR_SIDES)
    verify_value_allowed("size", ALLOWED_SIDEBAR_SIZES)
    verify_value_allowed("color", ALLOWED_COLORS)

    display_type <- ifelse(center, "labeled icon", "")
    inverted_value <- get_inverted_class(inverted)
    closable <- ifelse(closable, quote(true), quote(false))
    pushable <- ifelse(pushable, quote(true), quote(false))
    shiny::div(closable = closable, pushable = pushable,
               id = ..1$id, style = ifelse(side %in% c("top", "bottom"), "", "min-height: 100vh"),
               class = paste("ui", size, side, color, ifelse(side %in% c("top", "bottom"), "", "vertical"),
                             display_type, ifelse(visible, "visible", ""), inverted_value, "menu overlay sidebar"),
               ..1[-1])
  }
}

#' @describeIn dashboard_sidebar Create a sidebar of a dashboard (alias for \code{dashboard_sidebar} for compatibility with \code{shinydashboard})
#' @export
dashboardSidebar <- dashboard_sidebar


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
#'     dashboardSidebar(side = "left", size = "thin", color = "teal",
#'                      sidebarMenu(
#'                        menuItem(tabName = "tab1", "Tab 1"),
#'                        menuItem(tabName = "tab2", "Tab 2"))),
#'     dashboardBody(tabItems(
#'       tabItem(tabName = "tab1", p("Tab 1")),
#'       tabItem(tabName = "tab2", p("Tab 2"))))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboard_body <- function(...){
  shiny::div(class = "pusher container", style = "min-height: 100vh; margin-left: 0",
             shiny::tags$style(HTML(".tab-content, .ui.grid.container, .container {width:100%!important}")),
             shiny::div(class = "ui segment", style = "min-height: 100vh;",
                        shiny::tags$div(class = "ui stackable container grid", ...)))
}

#' @describeIn dashboard_body Create a body of a dashboard (alias for \code{dashboard_body} for compatibility with \code{shinydashboard})
#' @export
dashboardBody <- dashboard_body

#' Create a dashboard.
#' @description Create a page with menu item sidebar and body containing tabs and other additional elements.
#' @param  header Header of a dashboard.
#' @param  sidebar Sidebar of a dashboard.
#' @param  body Body of a dashboard.
#' @param  title Title of a dashboard.
#' @param  theme Theme name or path TODO list of themes
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
#'     dashboardHeader(color = "blue"),
#'     dashboardSidebar(side = "left", size = "thin", color = "teal",
#'                      sidebarMenu(
#'                        menuItem(tabName = "tab1", "Tab 1"),
#'                        menuItem(tabName = "tab2", "Tab 2"))),
#'     dashboardBody(tabItems(
#'       tabItem(tabName = "tab1", p("Tab 1")),
#'       tabItem(tabName = "tab2", p("Tab 2"))))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboard_page <- function(header, sidebar, body, title = "",
                           suppress_bootstrap = TRUE, theme = NULL) {
  # TODO: Remove this line when it is added to semanticPage()
  if (suppress_bootstrap) shiny::suppressDependencies("bootstrap")
  if (is.null(sidebar)) header$children[[1]] <- NULL
  shiny.semantic::semanticPage(header, sidebar, body, title = title,
                               theme = theme, get_dashboard_dependencies(),
                               shiny::tags$script(glue("sidebar_observer('{sidebar$attribs$id}')")))
}

#' @describeIn dashboard_page Create a dashboard (alias for \code{dashboard_page} for compatibility with \code{shinydashboard})
#' @export
dashboardPage <- dashboard_page
