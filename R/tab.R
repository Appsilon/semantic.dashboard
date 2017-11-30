#' Create a tab panel.
#'
#' @param id Id of the tab.
#' @param ... UI elements to include within the tab.
#' @param  active Should it be active.
#' @return A tab that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @examples
#' uitab(id = "b",
#' numericInput("n4", "nn", 50),
#' plotOutput("plot4"))
uitab <- function(id, ..., active = FALSE){
  shiny::div(role = "tabpanel", style = "height: 100%;", class = paste("ui", ifelse(active, "active", ""), "tab tab-pane"), `data-tab` = paste0("shiny-tab-", id), ...)
}
