#' Create a column.
#' @description Transforms number to corresponding string.
#' @param number Number to convert.
#' @return A string corresponding to inputed number.
num_to_string <- function(number){
  dplyr::case_when(number == 1 ~ "",
                   number == 2 ~ "two",
                   number == 3 ~ "three",
                   number == 4 ~ "four",
                   number == 5 ~ "five",
                   number == 6 ~ "six",
                   number == 7 ~ "seven",
                   number == 8 ~ "eight",
                   number == 9 ~ "nine",
                   number == 10 ~ "ten",
                   number == 11 ~ "eleven",
                   number == 12 ~ "twelve",
                   number == 13 ~ "thirteen",
                   number == 14 ~ "fourteen",
                   number == 15 ~ "fifteen",
                   number == 16 ~ "sixteen"
  )
}

#' Create a column.
#' @description Create a column with additional UI elements.
#' @param width Width of the column. Between 1 and 16.
#' @param ... UI elements to include within the column.
#' @return A column that can be passed to \code{\link[semantic.dashboard]{dashboardPage}}
#' @export
uicolumn <- function(width, ...){
  if (!is.numeric(width) || (width < 1) || (width > 16))
    stop("column width must be between 1 and 16")
  shiny::tags$div(class = paste(num_to_string(width), "wide column"), ...)
}

#' Create a column.
#' @description Create a column with additional UI elements.
#' @param width Width of the column. Between 1 and 16.
#' @param ... UI elements to include within the column.
#' @return A column that can be passed to \code{\link[semantic.dashboard]{dashboardPage}}
#' @export
column <- function(width, ...){
  uicolumn(width = width, ...)
}
