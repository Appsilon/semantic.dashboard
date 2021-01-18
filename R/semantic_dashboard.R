#' semantic.dashboard
#'
#' @name semantic.dashboard
#' @import htmltools
#' @import glue
#' @import checkmate
NULL

#' Create a header of a dashboard.
#' @description Create a header of a dashboard with other additional UI elements.
#'              Hint: use \code{shiny::tagList()} if you want to add multiple elements in \code{left} / \code{center} or \code{right}.
#' @param ... UI elements to include within the header. They will be displayed on the right side.
#' @param left UI element to put on the left of the header. It will be placed after (to the right) the title and menu button (if they exist).
#' @param center UI element to put in the center of the header.
#' @param right UI element to put to the right of the header. It will be placed before elements defined in \code{...} (if there are any).
#' @param title Dashboard title to be displayed in the upper left corner. If NULL, will not display any title field. Use "" for an empty title.
#' @param titleWidth Title field width, one of \code{c(NULL, "very thin", "thin", "wide", "very wide")}
#' @param logo_align Where should logo be placed. One of \code{c("left", "center")}
#' @param logo_path Path or URL of the logo to be shown in the header.
#' @param color Color of the sidebar / text / icons (depending on the value of `inverted` parameter. \
#'   One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param inverted If FALSE sidebar will be white and text will be colored. \
#'   If TRUE text will be white and background will be colored. Default is \code{FALSE}.
#' @param disable If \code{TRUE}, don't display the header.
#' @param show_menu_button If \code{FALSE}, don't display the menu button. Default is \code{TRUE}.
#' @param menu_button_label Text of the menu button. Default is \code{"Menu"}.
#' @param class CSS class to be applied to the container of \code{dashboardHeader}.
#' @return A header that can be passed to \code{\link[semantic.dashboard]{dashboardPage}}
#' @export
#' @examples
#' if(interactive()) {
#'
#'   library(shiny)
#'   library(semantic.dashboard)
#'
#'   ui <- dashboardPage(
#'     dashboardHeader(color = "blue", inverted = TRUE),
#'     dashboardSidebar(side = "left", size = "thin", color = "teal",
#'                      sidebarMenu(
#'                        menuItem(tabName = "tab1", "Tab 1"),
#'                        menuItem(tabName = "tab2", "Tab 2"))),
#'     dashboardBody(tabItems(
#'       tabItem(tabName = "tab1", p("Tab 1")),
#'       tabItem(tabName = "tab2", p("Tab 2"))))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboard_header <- function(..., left = NULL, center = NULL, right = NULL,
                             title = NULL, titleWidth = "thin",
                             logo_align = "center", logo_path = "",
                             color = "", inverted = FALSE, disable = FALSE,
                             show_menu_button = TRUE, menu_button_label = "Menu",
                             class = "") {
  if (disable) {
    NULL
  } else {
    verify_value_allowed("color", ALLOWED_COLORS)
    verify_value_allowed("titleWidth", ALLOWED_SIDEBAR_SIZES)

    inverted_value <- get_inverted_class(inverted)

    title_span <- if (!is.null(title)) {
      title_class <- paste(c("ui menu dashboard-title", titleWidth, inverted_value, color), collapse = " ")
      shiny::span(title, class = title_class)
    } else {
      NULL
    }

    logo <- if (logo_path != "") {
      shiny::tags$img(
        class="logo",
        src = logo_path
      )
    } else {
      NULL
    }

    menu_button <- if (isTRUE(show_menu_button)) {
      shiny::tags$a(
        id = "toggle_menu", class = "item",
        shiny::tags$i(class = "sidebar icon"),
        menu_button_label
      )
    } else {
      NULL
    }

    logo_left <- if (logo_align == "left") { logo }
    logo_center <- if (logo_align == "center") { logo }
    logo_right <- if (logo_align == "right") { logo }

    left_content <- div(class="header-part header-part__left", title_span, menu_button, logo_left, left)
    center_content <- div(class="header-part header-part__center", logo_center, center)
    right_content <- div(class="header-part header-part__right", logo_right, right, ...)

    shiny::div(
      class = paste("ui top attached dashboard-header", inverted_value, color, "menu", class),
      left_content,
      center_content,
      right_content
    )
  }
}

#' @describeIn dashboard_header Create a header of a dashboard (alias for \code{dashboard_header} for compatibility with \code{shinydashboard})
#' @export
dashboardHeader <- dashboard_header


#' Create a sidebar of a dashboard.
#' @description Create a pushable sidebar of a dashboard with menu items and other additional UI elements.
#' @param ... UI elements to include within the sidebar.
#' @param  side Placement of the sidebar. One of \code{c("left", "right", "top", "bottom")}
#' @param  size Size of the sidebar. One of \code{c("", "thin", "very thin", "wide", "very wide")}
#' @param  color Color of the sidebar / text / icons (depending on the value of `inverted` parameter. \
#'   One of \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param inverted If FALSE sidebar will be white and text will be colored. \
#'   If TRUE text will be white and background will be colored. Default is \code{FALSE}.
#' @param  center Should label and icon be centerd on menu items. Default to \code{FALSE}
#' @param  visible Should sidebar be visible on start. Default to \code{TRUE}
#' @param disable If \code{TRUE}, don't display the sidebar.
#' @param closable If \code{TRUE} allow close sidebar by clicking in the body. Default to \code{FALSE}
#' @param pushable If \code{TRUE} the menu button is active. Default to \code{TRUE}
#' @param overlay If \code{TRUE}, opened sidebar will cover the tab content. Otherwise it is displayed next to the content.
#'    Relevant only for sidebar positioned on left or right. Default to \code{FALSE}
#' @param dim_page If \code{TRUE}, page content will be darkened when sidebr is open. Default to \code{FALSE}
#' @param class CSS class to be applied to the container of \code{dashboardSidebar}.
#' @return A sidebar that can be passed to \code{\link[semantic.dashboard]{dashboardPage}}
#' @export
#' @examples
#' if(interactive()){
#'
#'   library(shiny)
#'   library(semantic.dashboard)
#'
#'   ui <- dashboardPage(
#'     dashboardHeader(color = "blue"),
#'     dashboardSidebar(side = "left", size = "thin", color = "teal",
#'                      sidebarMenu(
#'                        menuItem(tabName = "tab1", "Tab 1"),
#'                        menuItem(tabName = "tab2", "Tab 2"))),
#'     dashboardBody(tabItems(
#'       tabItem(tabName = "tab1", p("Tab 1")),
#'       tabItem(tabName = "tab2", p("Tab 2"))))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboard_sidebar <- function(..., side = "left", size = "thin", color = "", inverted = FALSE,
                              closable = FALSE, pushable = TRUE, center = FALSE, visible = TRUE,
                              disable = FALSE, overlay = FALSE, dim_page = FALSE, class = "") {
  if (disable || length(list(...)) < 1) {
    NULL
  } else {
    verify_value_allowed("side", ALLOWED_SIDEBAR_SIDES)
    verify_value_allowed("size", ALLOWED_SIDEBAR_SIZES)
    verify_value_allowed("color", ALLOWED_COLORS)

    display_type <- ifelse(center, "labeled icon", "")
    uncover_class <- ifelse(isTRUE(visible) & isFALSE(overlay), "uncover", "")
    overlay_class <- ifelse(isTRUE(visible) & isTRUE(overlay), "overlay", "")
    inverted_value <- get_inverted_class(inverted)

    closable <- ifelse(closable, quote(true), quote(false))
    pushable <- ifelse(pushable, quote(true), quote(false))
    overlay <- ifelse(overlay, quote(true), quote(false))
    dim_page <- ifelse(dim_page, quote(true), quote(false))

    shiny::div(closable = closable,
               id = ..1$id,
               class = paste("dashboard-sidebar ui", size, side, color, ifelse(side %in% c("top", "bottom"), "", "vertical"),
                             display_type, ifelse(visible, "visible", ""), inverted_value, "menu sidebar", uncover_class,
                             overlay_class, class),
               ..1[-1],
               shiny::tags$script(glue("initialize_sidebar({closable}, {pushable}, {overlay}, {dim_page})"))
               )

  }
}

#' @describeIn dashboard_sidebar Create a sidebar of a dashboard (alias for \code{dashboard_sidebar} for compatibility with \code{shinydashboard})
#' @export
dashboardSidebar <- dashboard_sidebar


#' Create a body of a dashboard.
#' @description Create a body of a dashboard with tabs and other additional UI elements.
#' @param ... UI elements to include within the body.
#' @param class CSS class to be applied to the container of \code{dashboardBody}. Note it's not the \code{<body>} tag.
#' @return A tab that can be passed to \code{\link[semantic.dashboard]{dashboardPage}}
#' @export
#' @examples
#' if(interactive()){
#'
#'   library(shiny)
#'   library(semantic.dashboard)
#'
#'   ui <- dashboardPage(
#'     dashboardHeader(color = "blue"),
#'     dashboardSidebar(side = "left", size = "thin", color = "teal",
#'                      sidebarMenu(
#'                        menuItem(tabName = "tab1", "Tab 1"),
#'                        menuItem(tabName = "tab2", "Tab 2"))),
#'     dashboardBody(tabItems(
#'       tabItem(tabName = "tab1", p("Tab 1")),
#'       tabItem(tabName = "tab2", p("Tab 2"))))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboard_body <- function(..., class = ""){
  shiny::div(class = paste("ui grid pusher dashboard-body", class), ...)
}

#' @describeIn dashboard_body Create a body of a dashboard (alias for \code{dashboard_body} for compatibility with \code{shinydashboard})
#' @export
dashboardBody <- dashboard_body

#' Create a dashboard.
#' @description Create a page with menu item sidebar and body containing tabs and other additional elements.
#' @param header Header of a dashboard.
#' @param sidebar Sidebar of a dashboard.
#' @param body Body of a dashboard.
#' @param title Title of a dashboard.
#' @param margin If \code{TRUE}, margin to be applied to the whole dashboard.
#' Defaults to \code{TRUE}.
#' @param theme Theme name or path. For possible options see \code{\link[shiny.semantic]{semanticPage}}.
#' @param class CSS class to be applied to the page container (\code{<body>} tag).
#' @param sidebar_and_body_container_class CSS class to be applied to the \code{div} containing
#' \code{dashboardSidebar} and \code{dashboardBody}.
#' @param suppress_bootstrap There are some conflicts in CSS styles between
#' FomanticUI and Bootstrap. For the time being it's better to suppress Bootstrap.
#' If \code{TRUE} bootstrap dependency from \code{shiny} will be disabled.
#' @return Dashboard.
#' @export
#' @examples
#' if(interactive()){
#'
#'   library(shiny)
#'   library(semantic.dashboard)
#'
#'   ui <- dashboardPage(
#'     dashboardHeader(color = "blue"),
#'     dashboardSidebar(side = "left", size = "thin", color = "teal",
#'                      sidebarMenu(
#'                        menuItem(tabName = "tab1", "Tab 1"),
#'                        menuItem(tabName = "tab2", "Tab 2"))),
#'     dashboardBody(tabItems(
#'       tabItem(tabName = "tab1", p("Tab 1")),
#'       tabItem(tabName = "tab2", p("Tab 2"))))
#'   )
#'
#'   server <- function(input, output) {
#'   }
#'
#'   shinyApp(ui, server)
#' }
dashboard_page <- function(header, sidebar, body, title = "",
                           suppress_bootstrap = TRUE, theme = NULL,
                           margin = TRUE, class = "", sidebar_and_body_container_class = "") {
  # TODO: Remove this line when it is added to semanticPage()
  if (is.null(sidebar)) header$children[[1]] <- NULL
  sidebar_and_body <- div(class = paste("ui bottom attached segment pushable", sidebar_and_body_container_class),
                             sidebar,
                              body)

  margin_class <- ifelse(isFALSE(margin), "no-margin", "")
  class <- paste("dashboard-page", margin_class, class)
  shiny.semantic::semanticPage(header, sidebar_and_body, get_dashboard_dependencies(), margin = "0",
                               title = title, theme = theme, suppress_bootstrap = suppress_bootstrap,
                               class = class)
}

#' @describeIn dashboard_page Create a dashboard (alias for \code{dashboard_page} for compatibility with \code{shinydashboard})
#' @export
dashboardPage <- dashboard_page
