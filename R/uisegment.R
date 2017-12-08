#' Create a box.
#' @description Create a box with additional UI elements.
#' @param ... UI elements to include within the box.
#' @param title Label of the box.
#' @param  color Color of the box. One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param ribbon Should label be presented as ribbon.
#' @param title_side Side of a label. One of \code{c("top", "bottom", "top left", "top right", "bottom left", "bottom right")}
#' @return A box that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
uisegment <- function(..., title = NULL, color = "", ribbon = TRUE, title_side = "top"){
  if (!(color %in% c("", "red", "orange", "yellow", "olive", "green", "teal",
                     "blue", "violet", "purple", "pink", "brown", "grey", "black"))){
    warning("'color' argument should be one of '', 'red', 'orange', 'yellow', 'olive', 'green', 'teal',
            'blue', 'violet', 'purple', 'pink', 'brown', 'grey', 'black'")
  }
  if (!(title_side %in% c("top", "bottom", "top left", "top right", "bottom left", "bottom right"))){
    warning("'title_side' argument should be one of 'top', 'bottom', 'top left', 'top right',
            'bottom left', 'bottom right'")
  }
  if (is.null(title) | !is.character(title)){
    shiny::div(class = paste("ui segment raised compact", color), ...)
  } else {
    title_class <- paste("ui", title_side, ifelse(ribbon, "ribbon", "attached"), "label", color)
    shiny::div(class = paste("ui segment raised compact", color),
               shiny::div(class = title_class, title), ...)
  }
}

#' Create a box.
#' @description Create a box with additional UI elements.
#' @param ... UI elements to include within the box.
#' @param title Label of the box.
#' @param  color Color of the box. One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param ribbon Should label be presented as ribbon.
#' @param title_side Side of a label. One of \code{c("top", "bottom", "top left", "top right", "bottom left", "bottom right")}
#' @return A box that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
#' @examples
#' if(interactive()){
#'
#'   library(shiny)
#'   library(semantic.dashboard)
#'
#'   ui <- dashboardPage(
#'     dashboardHeader(color = "blue"),
#'     dashboardSidebar(side = "top", size = "thin", color = "teal",
#'                      menuItem("tab1", "Tab 1"),
#'                      menuItem("tab2", "Tab 2")),
#'     dashboardBody(tabItem(tabName = "tab1", active = TRUE, p("Tab 1")),
#'                   tabItem(tabName = "tab2", p("Tab 2")))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
box <- function(..., title = NULL, color = "", ribbon = TRUE, title_side = "top right"){
  uisegment(..., title = title, color = color, ribbon = ribbon, title_side = title_side)
}
