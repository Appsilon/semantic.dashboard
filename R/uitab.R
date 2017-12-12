#' Create a tab panel.
#' @description Create a tab panel with additional UI elements.
#' @param tabName Id of the tab.
#' @param ... UI elements to include within the tab.
#' @param  active Should it be active.
#' @return A tab that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
uitab <- function(tabName, ..., active = FALSE){
  data_tab <- paste0("shiny-tab-", tabName)
  shiny::div(role = "tabpanel", style = "height: 100%;",
             class = paste("ui", ifelse(active, "active", ""), "tab tab-pane"),
             `data-tab` = data_tab, shiny::tags$div(class = "ui equal width grid", ...))
}

#' Create a tab panel.
#' @description Create a tab panel with additional UI elements.
#' @param tabName Id of the tab.
#' @param ... UI elements to include within the tab.
#' @param  active Should it be active.
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
tabItem <- function(tabName, ..., active = FALSE){
  uitab(tabName = tabName, ..., active = active)
}
