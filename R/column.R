#' Create a column.
#' @description Create a column with additional UI elements.
#' @param width Width of the column. Between 1 and 16.
#' @param ... UI elements to include within the column.
#' @return A column that can be passed to \code{\link[semantic.dashboard]{dashboardPage}}
#' @export
column <- function(width, ...){
  if (!is.numeric(width) || (width < MIN_COLUMN_WIDTH) || (width > MAX_COLUMN_WIDTH)){
    stop(paste("'width' must be between", MIN_COLUMN_WIDTH, "and", MAX_COLUMN_WIDTH))
  }
  shiny::tags$div(class = paste(COLUMN_WIDTHS[width], "wide column"), ...)
}
