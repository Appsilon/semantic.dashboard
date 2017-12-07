#' Create Semantic UI icon tag
#'
#' This creates an icon tag using Semantic UI styles.
#'
#' @param type A name of an icon. Look at http://semantic-ui.com/elements/icon.html for all possibilities.
#' @param ... Other arguments to be added as attributes of the tag (e.g. style, class etc.)
#'
#' @export
icon <- function(type = "", ...){
  shiny.semantic::uiicon(type = type, ...)
}

#' Create a menu item.
#' @description Create a menu item corresponding to a tab.
#' @param id Id of the tab.
#' @param label Label of the menu item.
#' @param icon Icon of the menu item. (Optional)
#' @return A menu item that can be passed \code{\link[semantic.dashboard]{dashboardSidebar}}
#' @export
uimenu_item <- function(id, label, icon = NULL){
  if (is.null(icon)) {
  shiny::tags$a(class = "item",
                `data-tab` = paste0("shiny-tab-", id), label)
  } else {
    shiny::tags$a(class = "item", icon,
                  `data-tab` = paste0("shiny-tab-", id), label)
  }
}

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
menuItem <- function(id, label, icon = NULL){
  uimenu_item(id = id, label = label, icon = icon)
}
