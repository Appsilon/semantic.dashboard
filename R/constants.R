ALLOWED_COLORS <- c("red", "orange", "yellow", "olive", "green", "teal",
                    "blue", "violet", "purple", "pink", "brown", "grey", "black")
ALLOWED_SIDEBAR_SIZES <- c("", "thin", "very thin", "wide", "very wide")
ALLOWED_SIDEBAR_SIDES <- c("left", "right", "top", "bottom")
ALLOWED_BOX_SIDES_NONRIBBON <- c("top", "bottom", "top left", "top right", "bottom left", "bottom right")
ALLOWED_BOX_SIDES_RIBBON <- c("top left", "top right")
COLUMN_WIDTHS <-   c("", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
                     "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen")
MIN_COLUMN_WIDTH <- 1
MAX_COLUMN_WIDTH <- 16
MIN_PROGRESS_VALUE <- 0
MAX_PROGRESS_VALUE <- 100

DROPDOWN_MENU_ICONS <- list(messages = "mail", notifications = "warning sign", tasks = "tasks")

sidebar_js <- "$('#uisidebar .item').tab({onVisible: function() {$(window).resize()} });
     $('#uisidebar')
  .sidebar({
    context: $('.pusher'),
    transition: 'push',
    dimPage: false,
    closable: false
  })
  .sidebar('attach events', '#toggle_menu');"

dropdown_menu_js <- "$('.ui.dropdown').dropdown();"

progress_bar_js <- "$('.progress').progress();"
