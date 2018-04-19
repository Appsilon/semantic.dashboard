#' Create a valueBox.
#' @description Create a valueBox with additional UI elements.
#' @param subtitle Label of the valueBox.
#' @param value Value of the valueBox.
#' @param icon Icon of the valueBox.
#' @param  color Color of the valueBox. One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param width Width of the valueBox.
#' @param size Size of value. One of \code{c("mini", "tiny", "small", "", "large", "huge")}. Default is "".
#' @return A valueBox that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
#' @examples
#' valueBox("Unread Mail", 44, icon("mail"), color = "blue", width = 5, size = "tiny")
value_box <- function(subtitle, value, icon = NULL, color = "blue", width = 5, size = ""){
  verify_value_allowed("color", ALLOWED_COLORS)
  verify_value_allowed("size", ALLOWED_VALUEBOX_SIZES)
  column(width = width,
         shiny::div(class = paste("ui fluid card", color),
                    shiny::div(class = paste("ui statistic", size),
                               shiny::div(class = "value", icon, value),
                               shiny::div(class = "label", subtitle))))
}

#' @describeIn value_box Create a valueBox (alias for \code{value_box} for compatibility with \code{shinydashboard})
#' @export
valueBox <- value_box

#' @describeIn value_box Create a valueBox (alias for \code{value_box} for compatibility with \code{shinydashboard})
#' @export
infoBox <- value_box
