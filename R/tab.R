#' Create a tab panel (alias for \code{tab} for compatibility with \code{shinydashboard})
#' @description Create a tab panel with additional UI elements.
#' @param tabName Id of the tab.
#' @param ... UI elements to include within the tab.
#' @return A tab that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
tab <- function(tabName, ...){
  data_tab <- paste0("shiny-tab-", tabName)
  shiny::div(role = "tabpanel", style = "height: 100%;",
             class = paste("ui", "tab tab-pane"),
             id = data_tab, `data-tab` = data_tab, shiny::tags$div(class = "ui equal width padded grid", ...))
}

#' @describeIn tab Create a tab panel (alias for \code{tab} for compatibility with \code{shinydashboard})
#' @export
tabItem <- tab

#' Create a panel with tabs (alias for \code{tabs} for compatibility with \code{shinydashboard})
#' @description Create a panel with tabs.
#' @param ... Tabs.
#' @param  selected Which tab should be active on start.
#' @return A panel with tabs that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
tabs <- function(..., selected = 1){
  tabs <- list(...)
  if (round(selected) < 1 | round(selected) > length(tabs) | !is.numeric(selected)){
    warning("Wrong tabItem selected, switched to first one!")
    selected_tab <- 1
  } else {
    selected_tab <- selected
  }
  tabs[[selected_tab]]$attribs$class <- paste(tabs[[selected_tab]]$attribs$class, "active")
  shiny::tags$div(class = "tab-content", tabs)
}

#' @describeIn tabs Create a panel with tabs (alias for \code{tabs} for compatibility with \code{shinydashboard})
#' @export
tabItems <- tabs