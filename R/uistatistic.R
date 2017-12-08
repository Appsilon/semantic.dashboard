#' Create a infoBox.
#' @description Create a infoBox with additional UI elements.
#' @param title Label of the infoBox.
#' @param value Value of the infoBox.
#' @param icon Icon of the infoBox.
#' @param  color Color of the box. One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @return A box that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
uistatistic <- function(title, value, icon = NULL, color = "blue"){
  if (!(color %in% c("red", "orange", "yellow", "olive", "green", "teal",
                     "blue", "violet", "purple", "pink", "brown", "grey", "black"))){
    warning("'color' argument should be one of 'red', 'orange', 'yellow', 'olive', 'green', 'teal',
            'blue', 'violet', 'purple', 'pink', 'brown', 'grey', 'black'")
  }
  shiny::div(class = paste("ui compact inverted segment", color),
             shiny::div(class = "ui statistic",
                        shiny::div(class = "value", icon, value),
                        shiny::div(class = "label", title)))
}

#' Create a infoBox.
#' @description Create a infoBox with additional UI elements.
#' @param title Label of the infoBox.
#' @param value Value of the infoBox.
#' @param icon Icon of the infoBox.
#' @param  color Color of the box. One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @return A box that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
infoBox <- function(title, value, icon = NULL, color = "blue"){
  uistatistic(title = title, value = value, icon = icon, color = color)
}

#' Create a group of stacked infoBoxes.
#' @description Create a group of stacked infoBoxes.
#' @param ... infoBoxes.
#' @return A group of stacked infoBoxes that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
uistatistics <- function(...){
  shiny::div(class = "ui horizontal segments", ...)
}

#' Create a group of stacked infoBoxes.
#' @description Create a group of stacked infoBoxes.
#' @param ... infoBoxes.
#' @return A group of stacked infoBoxes that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
infoBoxes <- function(...){
  uistatistics(...)
}
