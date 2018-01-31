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

#' @describeIn value_box_output Create a valueBox output (alias for \code{value_box_output} for compatibility with \code{shinydashboard})
#' @export
valueBoxOutput <- value_box_output

#' @describeIn value_box_output Create a valueBox output (alias for \code{value_box_output} for compatibility with \code{shinydashboard})
#' @export
infoBoxOutput <- value_box_output

#' Create a value box output.
#' @description Server-side function for dynamic valueBox.
#' @param expr ValueBox.
#' @param env The environment in which to evaluate expr.
#' @param quoted Is expr a quoted expression (with \code{quote()})? This is useful if you want to save an expression in a variable.
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

#' @describeIn render_value_box Create a value box output (alias for \code{render_value_box} for compatibility with \code{shinydashboard})
#' @export
renderValueBox <- render_value_box

#' @describeIn render_value_box Create a value box output (alias for \code{render_value_box} for compatibility with \code{shinydashboard})
#' @export
renderInfoBox <- render_value_box
