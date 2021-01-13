library(shiny)
library(semantic.dashboard)

ui <- dashboardPage(margin = TRUE,
  dashboardHeader(title = "Sample app",
                  titleWidth = "thin",
                  logo_path = "http://d2v95fjda94ghc.cloudfront.net/appsilon_logo.png",
                  logo_align = "center",
                  show_menu_button = FALSE,
                  left = tagList(h4("Header test"), shiny::icon("check-circle")),
                  center = h3("Appsilon"),
                  right = h5(Sys.time()),
                  dropdownMenu(type = "notifications",
                               taskItem("Project progress...", 50.777, color = "red")),
                  dropdownMenu(icon = icon("red warning sign"),
                               notificationItem("This is an important notification!", color = "red"))),

  dashboardSidebar(side = "left", size = "thin", color = "teal",
                   sidebarMenu(
                     menuItem(tabName = "tab1", "Tab 1"),
                     menuItem(tabName = "tab2", "Tab 2"))),

  dashboardBody(tabItems(
    tabItem(tabName = "tab1", p("Tab 1")),
    tabItem(tabName = "tab2", p("Tab 2"))))
)


server <- function(input, output) {
}

shinyApp(ui, server)
