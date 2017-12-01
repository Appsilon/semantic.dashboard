#' Create a menu item.
#' @description Create a menu item corresponding to a tab.
#' @param id Id of the tab.
#' @param label Label of the menu item.
#' @return A menu item that can be passed \code{\link[semantic.dashboard]{dashboardSidebar}}
#' @export
#' @examples
#' if(interactive()){
#'
#'   library(shiny)
#'   library(semantic.dashboard)
#'   library(plotly)
#'   library(DT)
#'
#'   ui <- dashboardPage(
#'     dashboardSidebar(side = "top", size = "thin", color = "teal",
#'                      uimenu_item("plot_tab", "My plot"),
#'                      uimenu_item("table_tab", "My table")),
#'     dashboardBody(uitab(id = "plot_tab", active = TRUE,
#'                         selectInput(inputId =  "variable1", choices = names(mtcars),
#'                                     label = "Select first variable", selected = "mpg"),
#'                         selectInput(inputId =  "variable2", choices = names(mtcars),
#'                                     label = "Select second variable", selected = "cyl"),
#'                         plotlyOutput("mtcars_plot")),
#'                   uitab(id = "table_tab",
#'                         dataTableOutput("mtcars_table")))
#'   )
#'
#'   server <- function(input, output) {
#'
#'     output$mtcars_plot <- renderPlotly(plot_ly(mtcars, x=~mtcars[ , input$variable1], y=~mtcars[ , input$variable2], width = "100%"))
#'     output$mtcars_table <- renderDataTable(mtcars)
#'
#'     lapply(c("mtcars_plot", "mtcars_table"),
#'            function(x) outputOptions(output, x, suspendWhenHidden = FALSE))
#'   }
#'
#'   shinyApp(ui, server)
#' }
uimenu_item <- function(id, label){
  shiny::tags$a(class="item", `data-tab` = paste0("shiny-tab-", id), label)
}
