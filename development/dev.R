APP_TO_RUN <- "examples"

# Generate CSS
source("styles/generate_css.R")

# Generate JS scripts (firstly run `npm i` inside tools dir)
system("gulp --cwd tools/.")

devtools::load_all(".")

shiny::runApp(APP_TO_RUN, port = 5167)
