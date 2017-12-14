ALLOWED_COLORS <- c("red", "orange", "yellow", "olive", "green", "teal",
                    "blue", "violet", "purple", "pink", "brown", "grey", "black")
ALLOWED_SIDEBAR_SIZES <- c("", "thin", "very thin", "wide", "very wide")
ALLOWED_SIDEBAR_SIDES <- c("left", "right", "top", "bottom")
ALLOWED_BOX_SIDES_NONRIBBON <- c("top", "bottom", "top left", "top right", "bottom left", "bottom right")
ALLOWED_BOX_SIDES_RIBBON <- c("top left", "top right")
COLUMN_WIDTHS <-   c("", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
                     "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen")
MIN_COLUMN_WIDTHS <- 1
MAX_COLUMN_WIDTHS <- 16

verify_value_allowed <- function(variable, values){
  if (!(get(variable, envir = parent.frame()) %in% values)){
    warning(paste(paste0("'", variable, "'", collapse = ", ") ,
                  "argument should be one of:",
                  paste0("'", values, "'", collapse = ", ")))
  }
}

sidebar_js <- "$('.sidebar.menu .item').tab({onVisible: function() {$(window).resize()} });
     $('.wrapper .ui.sidebar')
  .sidebar({
    context: $('.wrapper .pusher'),
    transition: 'push'
  })
  .sidebar('attach events', '.wrapper .menu .item')
;"
