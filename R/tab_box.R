#' Create a tab box.
#' @description Create a tab box with additional UI elements.
#' @param tabs Tabs to include within the box.
#' @param title Label of the box.
#' @param color Color of the box. One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param ribbon Should label be presented as ribbon.
#' @param title_side Side of a label. One of \code{c("top", "bottom", "top left", "top right", "bottom left", "bottom right")} if \code{ribbon = FALSE}, or one of \code{c("top left", "top right")} if \code{ribbon = TRUE}
#' @param collapsible Should minimize button be added to label.
#' @param width Width of the box.
#' @param id ID of the box.
#' @param ... other elements of the box.
#' @return A box that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
#' @examples
#' tabBox(title = "Sample tab box", color = "blue", width = 5,
#'        tabs = list(
#'          list(menu = "First Tab", content = "This is first tab"),
#'          list(menu = "Second Tab", content = "This is second tab")
#'        ))
tab_box <- function(tabs, title = NULL, color = "", ribbon = TRUE,
                    title_side = "top right", collapsible = TRUE, width = 8, id = NULL, ...) {
  box(shiny.semantic::tabset(tabs), title = title, color = color, ribbon = ribbon, title_side = title_side,
      collapsible = collapsible, width = width, id = id, ...)
}

#' @describeIn tab_box Create a tab box (alias for \code{tab_box} for compatibility with \code{shinydashboard})
#' @export
tabBox <- tab_box
