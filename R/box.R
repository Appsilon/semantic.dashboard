#' Create a box.
#' @description Create a box with additional UI elements.
#' @param ... UI elements to include within the box.
#' @param title Label of the box.
#' @param  color Color of the box. One of \code{c("", "red", "orange", "yellow",
#' "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black")}
#' @param ribbon Should label be presented as ribbon.
#' @param title_side Side of a label. One of \code{c("top", "bottom", "top left",
#' "top right", "bottom left", "bottom right")} if \code{ribbon = FALSE}, or one of
#' \code{c("top left", "top right")} if \code{ribbon = TRUE}
#' @param collapsible Should minimize button be added to label.
#' @param width Width of the box.
#' @param id ID of the box.
#' @param collapse_icon Icon class to be used for collapsing (when \code{collapsible = TRUE}).
#' @param expand_icon Icon class to be used for expanding (when \code{collapsible = TRUE}).
#' @return A box that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
#' @export
#' @examples
#' box(title = "Sample box", color = "blue", width = 11,
#'     "This is a box content"
#' )
box <- function(..., title = NULL, color = "", ribbon = TRUE, title_side = "top right",
                collapsible = TRUE, width = 8, id = NULL, collapse_icon = "minus",
                expand_icon = "plus") {
  verify_value_allowed("color", c("", ALLOWED_COLORS))
  verify_value_allowed("title_side", if (ribbon) ALLOWED_BOX_SIDES_RIBBON else ALLOWED_BOX_SIDES_NONRIBBON)
  box_id <- if (!is.character(id)) {
    paste0("box_", random_id_generator())
  } else {
    id
  }
  label <- if (!is.character(title)) {
    NULL
  } else {
    title_class <- paste("ui", title_side, ifelse(ribbon, "ribbon", "attached"), "label", color)
    minimize_button <- if (collapsible) {
      shiny.semantic::icon(collapse_icon, style = "cursor: pointer;")
    } else {
      NULL
    }
    shiny::div(class = title_class, minimize_button, title)
  }
  js_script <- glue::glue("$('#{box_id}').accordion({{
    selector: {{ trigger: '.title .icon' }},
    onOpening: function() {{ $('#{box_id}').find('.label .icon').removeClass('{expand_icon}').addClass('{collapse_icon}'); }},
    onClosing: function() {{ $('#{box_id}').find('.label .icon').removeClass('{collapse_icon}').addClass('{expand_icon}'); }}
  }});")
  column(width = width,
    shiny::div(class = paste("ui segment raised", color),
      shiny::div(id = box_id, class = "ui accordion",
        shiny::div(class = "title", style = "cursor: auto", label),
        shiny::div(class = "content active", shiny::div(...))
      )
    ),
    if (collapsible) shiny::singleton(shiny::tags$script(paste0("$(document).ready(function() { ", js_script, " })")))
  )
}
