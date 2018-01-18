#' Verify that given variable is in the list of allowed values.
verify_value_allowed <- function(variable, values){
  var <- get(variable, envir = parent.frame())
  if (!(var %in% values)){
    warning(paste(paste0("'", variable, "'"),
                  "argument should be one of:",
                  paste0("'", values, "'", collapse = ", ")))
  }
}

#' Changes logical inverted value to CSS class string.
get_inverted_class <- function(inverted) {
  ifelse(inverted, "inverted", "")
}

#' Interlace elements with dividers between each pair of elements.
interlace_dividers <- function(elements) {
  dividers <- lapply(1:length(elements), function(i) shiny::tags$div(class = "divider"))
  c(rbind(elements, dividers)) %>%
    head(-1) # Skips last divider.
}
