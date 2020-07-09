library(shiny)
library(DT)

clearColumnSearch <- function(proxy) {
  clearSearch(proxy = proxy)
  proxy$session$sendCustomMessage(type = "clearColumnSearch", message = list(tableid = proxy$id))
}

ui <- fluidPage(
  fluidRow(column(2, DTOutput("table"))),
  fluidRow(actionButton("clear", "Clear Filters")),
  tags$script(HTML("Shiny.addCustomMessageHandler('clearColumnSearch',
                   function(x) {
                   // outputId of the DT element
                   var table = document.getElementById(x.tableid);
                   // filter row of the table element within the DT element
                   var tablerow = table.getElementsByTagName('table')[0].rows[1];
                   // loop through each cell in the filter row
                   for (var i = 0, cell; cell = tablerow.cells[i]; i++) {
                   if(['factor', 'logical'].includes(cell.getAttribute('data-type'))) {
                   // find the selectize object
                   var dropdown = $(cell).find('.selectized').eq(0)[0].selectize;
                   // set to blank
                   dropdown.setValue('');
                   } else if(['number', 'integer', 'date', 'time'].includes(cell.getAttribute('data-type'))) {
                   // find the slider object
                   var slider = $(cell).find('.noUi-target').eq(0);
                   // get the endpoints of the slider
                   var min = slider.noUiSlider('options')['range']['min'];
                   var max = slider.noUiSlider('options')['range']['max'];
                   // set the value of the slider
                   slider.val([min, max]);
                   } else {}
                   }
                   });"))
)

server <- function(input, output, session) {
  
  data <- data.frame(LETTERS = c("A", "B", "C"))
  
  output$table <- renderDT({datatable(data, filter = list(position = "top", clear = FALSE))})
  
  observeEvent(input$clear, {
    clearColumnSearch(proxy = dataTableProxy("table"))
  })
  
}

shinyApp(ui = ui, server = server)  
