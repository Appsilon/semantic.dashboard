#' Create a sidebar menu output.
#' @description UI-side function for dynamic sidebarMenu.
#' @param outputId Id of the output.
#' @return A sidebar menu that can be passed to \code{\link[semantic.dashboard]{dashboardSidebar}}
#' @export
sidebar_menu_output <- function(outputId){
  shiny::uiOutput(outputId)
}

#' @describeIn sidebar_menu_output Create a sidebar menu output (alias for \code{sidebar_menu_output} for compatibility with \code{shinydashboard})
#' @export
sidebarMenuOutput <- sidebar_menu_output

#' Create a menu item output.
#' @description UI-side function for dynamic manuItem.
#' @param outputId Id of the output.
#' @return A menu item that can be passed to \code{\link[semantic.dashboard]{sidebarMenu}}
#' @export
menu_item_output <- function(outputId){
  shiny::uiOutput(outputId)
}

#' @describeIn menu_item_output Create a menu item output (alias for \code{menu_item_output} for compatibility with \code{shinydashboard})
#' @export
menuItemOutput <- menu_item_output

#' Create a menu output.
#' @description Server-side function for dynamic sidebarMenu.
#' @param expr menu.
#' @param env The environment in which to evaluate expr.
#' @param quoted Is expr a quoted expression (with \code{quote()})? This is useful if you want to save an expression in a variable.
#' @return A dynamic menu that can be assigned to output.
#' @export
render_menu <- function(expr, env = parent.frame(), quoted = FALSE){
  fun <- shiny::exprToFunction(expr, env, quoted)
  shiny::renderUI(fun())
}

#' @describeIn render_menu Create a menu output (alias for \code{render_menu} for compatibility with \code{shinydashboard})
#' @export
renderMenu <- render_menu
