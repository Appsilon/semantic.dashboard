#' Create a menu item corresponding to a tab.
#'
#' @param id Id of the tab.
#' @param label Label of the menu item.
#' @return A menu item that can be passed \code{\link[semantic.dashboard]{dashboardSidebar}}
#' @examples
#' uimenu_item("a", "Tab 1")
uimenu_item <- function(id, label){
  shiny::tags$a(class="item", `data-tab` = paste0("shiny-tab-", id), label)
}
