#' Create a tab panel.
#' @description Create a tab panel with additional UI elements.
#' @param tabName Id of the tab.
#' @param ... UI elements to include within the tab.
#' @return A tab that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
uitab <- function(tabName, ...){
  data_tab <- paste0("shiny-tab-", tabName)
  shiny::div(role = "tabpanel", style = "height: 100%;",
             class = paste("ui", "tab tab-pane"),
             id = data_tab, `data-tab` = data_tab, shiny::tags$div(class = "ui equal width grid", ...))
}

#' Create a tab panel.
#' @description Create a tab panel with additional UI elements.
#' @param tabName Id of the tab.
#' @param ... UI elements to include within the tab.
#' @return A tab that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
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
tabItem <- function(tabName, ...){
  uitab(tabName = tabName, ...)
}

#' Create a panel with tabs.
#' @description Create a panel with tabs.
#' @param ... Tabs.
#' @param  selected Which tab should be active on start.
#' @return A panel with tabs that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
uitabs <- function(..., selected = 1){
  tabs <- list(...)
  if (round(selected) < 1 | round(selected) > length(tabs) | !is.numeric(selected)){
    warning("Wrong tabItem selected, switched to first one!")
    tabs[[1]]$attribs$class <- paste(tabs[[1]]$attribs$class, "active")
  } else {
    tabs[[selected]]$attribs$class <- paste(tabs[[selected]]$attribs$class, "active")
  }
  div(class = "tab-content", tabs)
}

#' Create a panel with tabs.
#' @description Create a panel with tabs.
#' @param ... Tabs.
#' @param  selected Which tab should be active on start.
#' @return A panel with tabs that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
tabItems <- function(..., selected = 1){
  uitabs(..., selected = selected)
}
