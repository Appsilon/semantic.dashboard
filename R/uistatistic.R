#' Create a valueBox.
#' @description Create a valueBox with additional UI elements.
#' @param title Label of the valueBox.
#' @param value Value of the valueBox.
#' @param icon Icon of the valueBox.
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

#' Create a valueBox.
#' @description Create a valueBox with additional UI elements.
#' @param title Label of the valueBox.
#' @param value Value of the valueBox.
#' @param icon Icon of the valueBox.
#' @param  color Color of the box. One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @return A box that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
valueBox <- function(title, value, icon = NULL, color = "blue"){
  uistatistic(title = title, value = value, icon = icon, color = color)
}

#' Create a group of stacked valueBoxes.
#' @description Create a group of stacked valueBoxes.
#' @param ... valueBoxes.
#' @return A group of stacked valueBoxes that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
uistatistics <- function(...){
  shiny::div(class = "ui horizontal segments", ...)
}

#' Create a group of stacked valueBoxes.
#' @description Create a group of stacked valueBoxes.
#' @param ... valueBoxes.
#' @return A group of stacked valueBoxes that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
valueBoxes <- function(...){
  uistatistics(...)
}
