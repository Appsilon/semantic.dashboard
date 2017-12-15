#' Create a box.
#' @description Create a box with additional UI elements.
#' @param ... UI elements to include within the box.
#' @param title Label of the box.
#' @param  color Color of the box. One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param ribbon Should label be presented as ribbon.
#' @param title_side Side of a label. One of \code{c("top", "bottom", "top left", "top right", "bottom left", "bottom right")} if \code{ribbon = FALSE}, or one of \code{c("top left", "top right")} if \code{ribbon = TRUE}
#' @param collapsible Should minimize button be added to label.
#' @param width Width of the box.
#' @return A box that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
box <- function(..., title = NULL, color = "", ribbon = TRUE, title_side = "top right", collapsible = TRUE, width = 8){
  verify_value_allowed("color", c("", ALLOWED_COLORS))
  verify_value_allowed("title_side", if (ribbon) ALLOWED_BOX_SIDES_RIBBON else ALLOWED_BOX_SIDES_NONRIBBON)
  label <- if (!is.character(title)){
    NULL
  } else {
    title_class <- paste("ui", title_side, ifelse(ribbon, "ribbon", "attached"), "label", color)
    minimize_button <- if (collapsible) {
      shiny.semantic::uiicon("minimize window")
    } else {
      NULL
    }
    shiny::div(class = title_class, minimize_button, title)
  }
  column(width = width,
         shiny::div(class = paste("ui segment raised", color), label,  ...))
}
