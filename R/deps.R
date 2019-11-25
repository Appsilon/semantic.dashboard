#' Get the dependencies
#'
#' @return semantic.dashboard dependencies
get_dashboard_dependencies <- function() {
  list(
    htmlDependency(
      "semantic.dashboard",
      as.character(utils::packageVersion("semantic.dashboard")),
      c(file = system.file(package = "semantic.dashboard")),
      script = "semantic.dashboard.js"
    )
  )
}
