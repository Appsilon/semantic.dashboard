#' Create a valueBox (alias for \code{value_box} for compatibility with \code{shinydashboard})
#' @description Create a valueBox with additional UI elements.
#' @param title Label of the valueBox.
#' @param value Value of the valueBox.
#' @param icon Icon of the valueBox.
#' @param  color Color of the valueBox. One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param width Width of the valueBox.
#' @return A valueBox that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
value_box <- function(title, value, icon = NULL, color = "blue", width = 5){
  verify_value_allowed("color", ALLOWED_COLORS)
  if (!is.numeric(width) || (width < MIN_COLUMN_WIDTH) || (width > MAX_COLUMN_WIDTH))
    stop(paste("'value_box' width must be between"), MIN_COLUMN_WIDTH, "and", MAX_COLUMN_WIDTH)
  shiny::div(class = paste(COLUMN_WIDTHS[width], "wide column"),
             shiny::div(class = paste("ui fluid card", color),
                        shiny::div(class = "ui statistic",
                                   shiny::div(class = "value", icon, value),
                                   shiny::div(class = "label", title))))
}

#' @describeIn value_box Create a valueBox (alias for \code{value_box} for compatibility with \code{shinydashboard})
#' @export
valueBox <- value_box
