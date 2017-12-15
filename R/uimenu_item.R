#' Create Semantic UI icon tag (alias for \code{uiicon} for compatibility with \code{shinydashboard})
#'
#' This creates an icon tag using Semantic UI styles.
#'
#' @param type A name of an icon. Look at http://semantic-ui.com/elements/icon.html for all possibilities.
#' @param ... Other arguments to be added as attributes of the tag (e.g. style, class etc.)
#'
#' @export
icon <- shiny.semantic::uiicon

#' Create a menu item (alias for \code{manu_item} for compatibility with \code{shinydashboard})
#' @description Create a menu item corresponding to a tab.
#' @param tabName Id of the tab.
#' @param label Label of the menu item.
#' @param icon Icon of the menu item. (Optional)
#' @return A menu item that can be passed \code{\link[semantic.dashboard]{dashboardSidebar}}
#' @export
menu_item <- function(tabName, label, icon = NULL){
  data_tab <- paste0("shiny-tab-", tabName)
    shiny::tags$a(class = "item", href = paste0("#", data_tab), icon, label, `data-tab` = data_tab,
                  `data-toggle` = "tab", `data-value` = "dashboard")
}

#' @describeIn menu_item Create a menu item (alias for \code{manu_item} for compatibility with \code{shinydashboard})
#' @export
menuItem <- menu_item
