verify_value_allowed <- function(variable, values){
  var <- get(variable, envir = parent.frame())
  if (!(var %in% values)){
    warning(paste(paste0("'", variable, "'"),
                  "argument should be one of:",
                  paste0("'", values, "'", collapse = ", ")))
  }
}

get_inverted_class <- function(inverted) {
  ifelse(inverted, "inverted", "")
}
