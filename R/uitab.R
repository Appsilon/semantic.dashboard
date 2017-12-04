#' Create a tab panel.
#' @description Create a tab panel with additional UI elements.
#' @param id Id of the tab.
#' @param ... UI elements to include within the tab.
#' @param  active Should it be active.
#' @return A tab that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
uitab <- function(id, ..., active = FALSE){
  data_tab = paste0("shiny-tab-", id)
  shiny::div(role = "tabpanel", style = "height: 100%;", class = paste("ui", ifelse(active, "active", ""), "tab tab-pane"), `data-tab` = data_tab, ...)
}
