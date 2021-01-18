ALLOWED_COLORS <- c("", "red", "orange", "yellow", "olive", "green", "teal",
                    "blue", "violet", "purple", "pink", "brown", "grey", "black")
ALLOWED_SIDEBAR_SIZES <- c("", "thin", "very thin", "wide", "very wide")
ALLOWED_SIDEBAR_SIDES <- c("left", "right", "top", "bottom")
ALLOWED_VALUEBOX_SIZES <- c("mini", "tiny", "small", "", "large", "huge")
ALLOWED_BOX_SIDES_NONRIBBON <- c("top", "bottom", "top left", "top right", "bottom left", "bottom right")
ALLOWED_BOX_SIDES_RIBBON <- c("top left", "top right")
COLUMN_WIDTHS <-   c("", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
                     "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen")
MIN_COLUMN_WIDTH <- 1
MAX_COLUMN_WIDTH <- 16
MIN_PROGRESS_VALUE <- 0
MAX_PROGRESS_VALUE <- 100

DROPDOWN_MENU_ICONS <- list(messages = "mail", notifications = "warning sign", tasks = "tasks")

dropdown_menu_js <- "$('.ui.dropdown').dropdown();"

progress_bar_js <- "$('.progress').progress();"

#' Semantic colors
#' https://github.com/Semantic-Org/Semantic-UI/blob/master/src/themes/default/globals/site.variables
#' @export
semantic_palette <- c("#A333C8", "#21BA45", "#2185D0", "#DB2828", "#F2711C", "#FBBD08", "#B5CC18",
                      "#00B5AD", "#6435C9", "#E03997", "#A5673F", "#767676", "#1B1C1D")
names(semantic_palette) <- c("purple", "green", "blue", "red", "orange", "yellow", "olive", "teal",
                             "violet", "pink", "brown", "grey", "black")

#' Semantic light colors
#' https://github.com/Semantic-Org/Semantic-UI/blob/master/src/themes/default/globals/site.variables
#' @export
light_semantic_palette <- c("#DC73FF", "#2ECC40", "#54C8FF", "#FF695E", "#FF851B", "#FFE21F",
                            "#D9E778", "#6DFFFF", "#A291FB", "#FF8EDF", "#D67C1C", "#DCDDDE",
                            "#545454")

names(light_semantic_palette) <- c("lightPurple", "lightGreen", "lightBlue", "lightRed",
                                   "lightOrange", "lightYellow", "lightOlive", "lightTeal",
                                   "lightViolet", "lightPink", "lightBrown", "lightGrey",
                                   "lightBlack")
