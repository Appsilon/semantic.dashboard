#' Create a valueBox.
#' @description Create a valueBox with additional UI elements.
#' @param title Label of the valueBox.
#' @param value Value of the valueBox.
#' @param icon Icon of the valueBox.
#' @param  color Color of the valueBox. One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @return A valueBox that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
uivalue_box <- function(title, value, icon = NULL, color = "blue"){
  if (!(color %in% uicolors)){
    warning(paste("'color' argument should be one of:", paste0("'", uicolors, "'", collapse = ", ")))
  }
  shiny::div(class = paste("ui fluid card", color),
             shiny::div(class = "ui statistic",
                        shiny::div(class = "value", icon, value),
                        shiny::div(class = "label", title)))
}

#' Create a valueBox.
#' @description Create a valueBox with additional UI elements.
#' @param title Label of the valueBox.
#' @param value Value of the valueBox.
#' @param icon Icon of the valueBox.
#' @param  color Color of the valueBox. One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @return A valueBox that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
valueBox <- function(title, value, icon = NULL, color = "blue"){
  uivalue_box(title = title, value = value, icon = icon, color = color)
}
