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
  if (!(color %in% c("", uicolors))){
    warning(paste("'color' argument should be one of:", paste0("'", c("", uicolors), "'", collapse = ", ")))
  }
  if (!ribbon & !(title_side %in% c("top", "bottom", "top left", "top right", "bottom left", "bottom right"))){
    warning("If 'ribbon' agrument is set to 'FALSE' 'title_side' argument should be one of 'top', 'bottom', 'top left', 'top right',
            'bottom left', 'bottom right'")
  }
  if (ribbon & !(title_side %in% c("top", "bottom", "top left", "top right", "bottom left", "bottom right"))){
    warning("If 'ribbon' agrument is set to 'TRUE' 'title_side' argument should be one of 'top left', 'top right'")
  }
  if (is.null(title) | !is.character(title)){
    label <- NULL
  } else {
    minimize_btn <- NULL
    title_class <- paste("ui", title_side, ifelse(ribbon, "ribbon", "attached"), "label", color)
    if (collapsible){
      minimize_btn <- shiny.semantic::uiicon("minimize window")
    }
    label <- shiny::div(class = title_class, minimize_btn, title)
  }
  shiny::div(class = paste("ui segment raised", color), label,  ...)
}

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
box <- function(..., title = NULL, color = "", ribbon = TRUE, title_side = "top right", collapsible = TRUE){
  uibox(..., title = title, color = color, ribbon = ribbon, title_side = title_side, collapsible = collapsible)
}
