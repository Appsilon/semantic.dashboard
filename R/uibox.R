#' Create a box.
#' @description Create a box with additional UI elements.
#' @param ... UI elements to include within the box.
#' @param title Label of the box.
#' @param  color Color of the box. One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param ribbon Should label be presented as ribbon.
#' @param title_side Side of a label. One of \code{c("top", "bottom", "top left", "top right", "bottom left", "bottom right")} if \code{ribbon = FALSE}, or one of \code{c("top left", "top right")} if \code{ribbon = TRUE}
#' @param collapsible Should minimize button be added to label.
#' @return A box that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
uibox <- function(..., title = NULL, color = "", ribbon = TRUE, title_side = "top right", collapsible = TRUE){
  verify_value_allowed("color", c("", ALLOWED_COLORS))
  if (ribbon){
    verify_value_allowed("title_side", ALLOWED_BOX_SIDES_RIBBON)
  } else {
    verify_value_allowed("title_side", ALLOWED_BOX_SIDES_NONRIBBON)
  }
  if (!is.character(title)){
    label <- NULL
  } else {
    minimize_button <- NULL
    title_class <- paste("ui", title_side, ifelse(ribbon, "ribbon", "attached"), "label", color)
    if (collapsible){
      minimize_button <- shiny.semantic::uiicon("minimize window")
    }
    label <- shiny::div(class = title_class, minimize_button, title)
  }
  shiny::div(class = paste("ui segment raised", color), label,  ...)
}

#' @describeIn uibox Create a box.
#' @export
box <- function(..., title = NULL, color = "", ribbon = TRUE, title_side = "top right", collapsible = TRUE){
  uibox(..., title = title, color = color, ribbon = ribbon, title_side = title_side, collapsible = collapsible)
}
