#' Get the semantic.dashboard dependencies
#'
#' @description To add dependencies in the future follow the \code{\link[htmltools]{htmlDependency}} help.
#'
#' @return semantic.dashboard dependencies
get_dashboard_dependencies <- function() {
  list(
    htmlDependency(
      "semantic.dashboard",
      as.character(utils::packageVersion("semantic.dashboard")),
      c(file = system.file(package = "semantic.dashboard")),
      script = "semantic.dashboard.min.js",
      stylesheet = "semantic.dashboard.min.css"
    )
  )
}
