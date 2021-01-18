#' Create a dropdown menu.
#' @description Create a dropdown menu with additional UI elements.
#' @param ... UI elements to include within the dropdown menu.
#' @param type Type of the displayed items.
#' @param icon Icon of the dropdown menu. If not specyfied created based on \code{type} agrument.
#' @param show_counter If true circular label with counter is going to be shown for dropdown.
#' @return A dropdown menu that can be passed to \code{\link[semantic.dashboard]{dashboardHeader}}
#' @export
#' @examples
#' dropdownMenu(icon = icon("warning sign"), taskItem("Project progress...", 50.777, color = "red"))
#' dropdownMenu(type = "notifications", notificationItem("This is notification!", color = "red"))
dropdown_menu <- function(..., type = "messages", icon = NULL, show_counter = TRUE) {
  icon <- if (!is.null(icon)) {
    icon
  } else {
    icon(DROPDOWN_MENU_ICONS[[type]])
  }
  notifications <- list(...)
  counter <- if (show_counter) {
    shiny::tags$div(class = "ui circular mini label", length(notifications), style = "")
  } else {
    NULL
  }

  shiny::tags$button(class = "ui icon top right inline item dropdown button",
                     style = "margin-right: 0",
                     icon,
                     counter,
                     shiny::tags$div(class = "menu", interlace_dividers(notifications)),
                     shiny::tags$script(dropdown_menu_js),
                     shiny::tags$script(progress_bar_js))
}

#' @describeIn dropdown_menu Create a dropdown menu (alias for \code{dropdown_menu} for compatibility with \code{shinydashboard})
#' @export
dropdownMenu <- dropdown_menu

#' Create a message item.
#' @description Create a message item.
#' @param from Who the message is from.
#' @param message Text of the message.
#' @param ... Additional UI elements to include within the dropdown menu.
#' @param icon Additional icon.
#' @return A message item that can be passed to \code{\link[semantic.dashboard]{dropdownMenu}}
#' @export
#' @examples
#' messageItem("Marek", "Another test!", icon = "warning")
message_item <- function(from, message, ..., icon = "user") {
  shiny::tags$a(class = "item",
                shiny::tags$span(class = "description", message),
                shiny::tags$span(class = "text",
                                 shiny::tags$i(class = paste(icon, "icon")),
                                 from),
                ...)
}

#' @describeIn message_item Create a message item (alias for \code{message_item} for compatibility with \code{shinydashboard})
#' @export
messageItem <- message_item

#' Create a task item.
#' @description Create a task item.
#' @param text Progress bar label.
#' @param value Progress bar value.
#' @param color Color of the task item. One of \code{c("", "red", "orange",
#' "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink",
#' "brown", "grey", "black")}
#' @return A task item that can be passed to \code{\link[semantic.dashboard]{dropdownMenu}}
#' @export
#' @examples
#' taskItem("Project progress...", 50.777, color = "red")
task_item <- function(text, value, color = ""){
  if (!is.numeric(value) || (value < MIN_PROGRESS_VALUE) || (value > MAX_PROGRESS_VALUE)){
    warning(paste("'value' must be between", MIN_PROGRESS_VALUE, "and", MAX_PROGRESS_VALUE))
  }
  verify_value_allowed("color", c("", ALLOWED_COLORS))
  shiny::tags$div(class = "item", style = "min-width: 200px;",
                  shiny::tags$div(class = paste("ui active progress", color),
                                  `data-percent` = value, `data-total` = 100,
                                  shiny::tags$div(class = "bar", shiny::tags$div(class = "progress")),
                                  shiny::tags$div(class = "label", text)))
}

#' @describeIn task_item Create a task item (alias for \code{taks_item} for compatibility with \code{shinydashboard})
#' @export
taskItem <- task_item

#' Create a notification item.
#' @description Create a notification item.
#' @param text Text of the notification.
#' @param icon Additional icon.
#' @param color Color of the notification item. One of
#' \code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue",
#' "violet", "purple", "pink", "brown", "grey", "black")}
#' @return A notification item that can be passed to \code{\link[semantic.dashboard]{dropdownMenu}}
#' @export
#' @examples
#' notificationItem("This is notification!", color = "red")
notification_item <- function(text, icon = "warning", color = ""){
  verify_value_allowed("color", c("", ALLOWED_COLORS))
  shiny::tags$div(class = "item",
                  shiny::tags$div(class = paste("ui label", color),
                                  shiny::tags$i(class = paste("small", icon, "icon")), text))
}

#' @describeIn notification_item Create a notification item (alias for \code{notification_item} for compatibility with \code{shinydashboard})
#' @export
notificationItem <- notification_item
