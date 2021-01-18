sass::sass(
  sass::sass_file("styles/main.scss"),
  options = sass::sass_options(output_style = "compressed"),
  output = "inst/semantic.dashboard.min.css",
  cache_options = sass::sass_cache_options(FALSE)
)

sass::sass(
  sass::sass_file("styles/main.scss"),
  options = sass::sass_options(output_style = "expanded"),
  output = "inst/semantic.dashboard.css",
  cache_options = sass::sass_cache_options(FALSE)
)
