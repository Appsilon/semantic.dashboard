#' Create a column.
#' @description Create a column with additional UI elements.
#' @param width Width of the column. Between 1 and 16.
#' @param ... UI elements to include within the column.
#' @return A column that can be passed to \code{\link[semantic.dashboard]{dashboardPage}}
#' @export
uicolumn <- function(width, ...){
  if (!is.numeric(width) || (width < MIN_COLUMN_WIDTHS) || (width > MAX_COLUMN_WIDTHS))
    stop(paste("column width must be between"), MIN_COLUMN_WIDTHS, "and", MAX_COLUMN_WIDTHS)
  shiny::tags$div(class = paste(COLUMN_WIDTHS[width], "wide column"), ...)
}

#' @describeIn uicolumn Create a column.
#' @export
column <- function(width, ...){
  uicolumn(width = width, ...)
}
