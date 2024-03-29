#' Create a tab
#'
#' Create a tab panel with additional UI elements.
#'
#' @param tabName Id of the tab.
#' @param fluid Controls whether tab width should be 100\% (TRUE) or limited by Foomantic UI
#'   breakpoints (FALSE).
#' @param ... UI elements to include within the tab.
#' @return A tab that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
#' @examples
#' tab_item(tabName = "tab1", "Tab 1")
tab_item <- function(tabName, ..., fluid = TRUE) {
  data_tab <- paste0("shiny-tab-", tabName)
  shiny::div(role = "tabpanel", style = "height: 100%;",
             class = paste("ui", "tab tab-pane container", ifelse(fluid, "fluid", "")),
             id = data_tab, `data-tab` = data_tab, shiny::tags$div(class = "ui padded grid", ...))
}

#' @describeIn tab_item Create a tab (alias for \code{tab_item} for compatibility with
#'   \code{shinydashboard})
#' @export
tabItem <- tab_item

#' Create a panel with tabs.
#' @description Create a panel with tabs.
#' @param ... Tabs.
#' @return A panel with tabs that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
#' @examples
#' tabItems(
#'  tabItem(tabName = "tab1", "Tab 1"),
#'  tabItem(tabName = "tab2", "Tab 2"))
tab_items <- function(...) {
  shiny::tags$div(class = "tab-content", list(...))
}

#' @describeIn tab_items Create a panel with tabs (alias for \code{tab_items} for compatibility
#'   with \code{shinydashboard})
#' @export
tabItems <- tab_items
