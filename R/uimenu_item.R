#' Create a menu item.
#' @description Create a menu item corresponding to a tab.
#' @param id Id of the tab.
#' @param label Label of the menu item.
#' @param icon Icon of the menu item. (Optional)
#' @return A menu item that can be passed \code{\link[semantic.dashboard]{dashboardSidebar}}
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
uimenu_item <- function(id, label, icon = NULL){
  if (is.null(icon)) {
  shiny::tags$a(class = "item",
                `data-tab` = paste0("shiny-tab-", id), label)
  } else {
    shiny::tags$a(class = "item", icon,
                  `data-tab` = paste0("shiny-tab-", id), label)
  }
}
