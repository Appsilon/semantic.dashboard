linters_config <- lintr::with_defaults(
  object_usage_linter = NULL,
  #absolute_paths_linter = NULL,
  #assignment_linter = NULL,
  #closed_curly_linter = NULL,
  #commas_linter = NULL,
  #infix_spaces_linter = NULL,
  line_length_linter = lintr::line_length_linter(120),
  #no_tab_linter = NULL,
  camel_case_linter = NULL,
  snake_case_linter = NULL,
  multiple_dots_linter = NULL,
  #object_length_linter = NULL,
  #open_curly_linter = NULL,
  #single_quotes_linter = NULL,
  #spaces_inside_linter = NULL,
  #spaces_left_parentheses_linter = NULL,
  #trailing_blank_lines_linter = NULL,
  #trailing_whitespace_linter = NULL
)

if (requireNamespace("lintr", quietly = TRUE)) {
  context("lints")
  test_that("Package Style", {

    lintr::expect_lint_free(linters = linters_config)
  })
}
