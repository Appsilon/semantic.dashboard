#' Create a valueBox.
#' @description Create a valueBox with additional UI elements.
#' @param title Label of the valueBox.
#' @param value Value of the valueBox.
#' @param icon Icon of the valueBox.
#' @param  color Color of the valueBox. One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @return A valueBox that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
value_box <- function(title, value, icon = NULL, color = "blue"){
  verify_value_allowed("color", ALLOWED_COLORS)
  shiny::div(class = paste("ui fluid card", color),
             shiny::div(class = "ui statistic",
                        shiny::div(class = "value", icon, value),
                        shiny::div(class = "label", title)))
}

#' @describeIn value_box Create a valueBox.
#' @export
valueBox <- value_box
