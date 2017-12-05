#' Create a tab panel.
#' @description Create a tab panel with additional UI elements.
#' @param id Id of the tab.
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
#'     dashboardSidebar(side = "top", size = "thin", color = "teal",
#'                      uimenu_item("tab1", "Tab 1"),
#'                      uimenu_item("tab2", "Tab 2")),
#'     dashboardBody(uitab(id = "tab1", active = TRUE, p("Tab 1")),
#'                   uitab(id = "tab2", p("Tab 2")))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
uitab <- function(id, ..., active = FALSE){
  data_tab = paste0("shiny-tab-", id)
  shiny::div(role = "tabpanel", style = "height: 100%;", class = paste("ui", ifelse(active, "active", ""), "tab tab-pane"), `data-tab` = data_tab, ...)
}
