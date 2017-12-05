linters_config <- lintr::with_defaults(
  object_usage_linter = NULL,
  line_length_linter = lintr::line_length_linter(120),
  camel_case_linter = NULL,
  snake_case_linter = NULL,
  multiple_dots_linter = NULL
)

if (requireNamespace("lintr", quietly = TRUE)) {
  context("lints")
  test_that("Package Style", {

    lintr::expect_lint_free(linters = linters_config)
  })
}
