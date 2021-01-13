APP_TO_RUN <- "examples"
# APP_TO_RUN <- "examples/bus"
# APP_TO_RUN <- "examples/crandash"
# APP_TO_RUN <- "examples/sales"
# APP_TO_RUN <- "examples/minimal/app_sidebar_options.R"
# APP_TO_RUN <- "examples/minimal/app_sidebar_condition_panel.R"
# APP_TO_RUN <- "examples/minimal/app_no_sidebar.R"
# APP_TO_RUN <- "examples/minimal/app_no_header.R"
# APP_TO_RUN <- "examples/minimal/app_header_elements.R"
# APP_TO_RUN <- "examples/themes/app-darktheme.R"

# Generate CSS
source("styles/generate_css.R")

# Generate JS scripts (firstly run `npm i` inside tools dir)
system("gulp --cwd tools/.")

devtools::load_all(".")

shiny::runApp(APP_TO_RUN, port = 5167)
