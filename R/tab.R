#' Create a tab panel.
#' @description Create a tab panel with additional UI elements.
#' @param id Id of the tab.
#' @param ... UI elements to include within the tab.
#' @param  active Should it be active.
#' @return A tab that can be passed to \code{\link[semantic.dashboard]{dashboardBody}}
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
uitab <- function(id, ..., active = FALSE){
  shiny::div(role = "tabpanel", style = "height: 100%;", class = paste("ui", ifelse(active, "active", ""), "tab tab-pane"), `data-tab` = paste0("shiny-tab-", id), ...)
}
