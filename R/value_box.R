#' Create a valueBox.
#' @description Create a valueBox with additional UI elements.
#' @param subtitle Label of the valueBox.
#' @param value Value of the valueBox.
#' @param icon Icon of the valueBox.
#' @param  color Color of the valueBox. One of \code{c("", "red", "orange", "yellow",
#' "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param width Width of the valueBox.
#' @param size Size of value. One of \code{c("mini", "tiny", "small", "", "large", "huge")}.
#' Default is "".
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

#' @describeIn value_box Create a valueBox (alias for \code{value_box})
#' @export
valueBox <- value_box

#' @describeIn value_box Create a valueBox (alias for \code{value_box})
#' @export
infoBox <- value_box


#' Create a value box output.
#' @description UI-side function for dynamic valueBox.
#' @param outputId Id of the output.
#' @param width Width of the valueBox.
#' @return A value box that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
#' @examples
#' \dontrun{
#' valueBoxOutput("value_box")
#'
#' output$value_box <- renderValueBox({
#'   valueBox(
#'     value = 33.45,
#'     subtitle = "Simple valuebox",
#'     icon = icon("bar chart"),
#'     color = "purple",
#'     width = 5)
#' })
#' }
value_box_output <- function(outputId, width = 5){
  column(width = width, shiny::uiOutput(outputId))
}

#' @describeIn value_box_output Create a valueBox output (alias for \code{value_box_output})
#' @export
valueBoxOutput <- value_box_output

#' @describeIn value_box_output Create a valueBox output (alias for \code{value_box_output})
#' @export
infoBoxOutput <- value_box_output

#' Create a value box output.
#' @description Server-side function for dynamic valueBox.
#' @param expr ValueBox.
#' @param env The environment in which to evaluate expr.
#' @param quoted Is expr a quoted expression (with \code{quote()})?
#' This is useful if you want to save an expression in a variable.
#' @return A dynamic valueBox that can be assigned to output.
#' @export
#' @examples
#' \dontrun{
#' valueBoxOutput("value_box")
#'
#' output$value_box <- renderValueBox({
#'   valueBox(
#'     value = 33.45,
#'     subtitle = "Simple valuebox",
#'     icon = icon("bar chart"),
#'     color = "purple",
#'     width = 5)
#' })
#' }
render_value_box <- function(expr, env = parent.frame(), quoted = FALSE){
  fun <- shiny::exprToFunction(expr, env, quoted)
  shiny::renderUI(fun())
}

#' @describeIn render_value_box Create a value box output (alias for \code{render_value_box})
#' @export
renderValueBox <- render_value_box

#' @describeIn render_value_box Create a value box output (alias for \code{render_value_box})
#' @export
renderInfoBox <- render_value_box

