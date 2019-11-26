#' Get the dependencies
#'
#' @return semantic.dashboard dependencies
get_dashboard_dependencies <- function() {
  minified <- ""
  if (getOption("shiny.minified", TRUE)) {
    minified <- ".min"
  }
  list(
    htmlDependency(
      "semantic.dashboard",
      as.character(utils::packageVersion("semantic.dashboard")),
      c(file = system.file(package = "semantic.dashboard")),
      script = glue("semantic.dashboard{minified}.js")
    )
  )
}
