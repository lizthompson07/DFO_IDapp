# ---- Data File ----
dat <- read.csv(file="./coding02July2020.csv")

# ---- Server ----

# Action button to select all rows in current view
var <- reactiveValues()
tableProxy <- dataTableProxy('table')

observeEvent(input$select_all_current, {
  print("select_all_current")
  selectRows(proxy = tableProxy,
             selected = input$table_rows_current)
})

# Action button to add all rows in current view to previous selection
observeEvent(input$add_to_selection, {
  print("select_all_current")
  
  selectRows(proxy = tableProxy,
             selected = c(input$table_rows_selected, input$table_rows_current))

})

# Action button to clear row selection
selected_rows <- reactiveVal()

tableProxy <- dataTableProxy('table')

observeEvent(input$select_clear, {
  print("select_clear")
  tableProxy %>% selectRows(NULL)
  selected_rows(NULL)
})

# Action button to clear filters -- only works if you run program in a web browser 
clearColumnSearch <- function(proxy) {
  clearSearch(proxy = proxy)
  proxy$session$sendCustomMessage(type = "clearColumnSearch", message = list(tableid = proxy$id))
}

observeEvent(input$filter_clear, {
  print("select_clear")
  clearColumnSearch(proxy = dataTableProxy("table"))
})

# Data table with filtering
output$table = DT::renderDT(
  datatable(dat, filter = list(position = "top", clear = FALSE), 
            selection = list(target = 'row'),
            options = list(
              autowidth = TRUE,
              columnDefs = list(list(width = '185px', targets = list(7,8,9,10)),
                                list(className = 'dt-center', targets = '_all'),
                                list(visible = FALSE, targets=c(0,11,12))),
              pageLength = 6,
              lengthMenu = c(6, 12, 18, 24, 30, 42, 58))
            ),
  server = FALSE,
  )

# Reactive call that only renders images for selected rows (can change to "table_rows_current" to get all filtered results)
df <- reactive({
  dat[input[["table_rows_selected"]], ]
})

# Head image output with titlescript.js which gives the name of the image file on mouseover
output$images = renderUI({
  imgs <- lapply(df()$whaleimage, function(file){
    tags$div(
      tags$img(src=file, width="100%", height="100%"),
      tags$script(src="titlescript.js")
    )
    
  })
  do.call(tagList, imgs)
})

# Tail image output with titlescript.js which gives the name of the image file on mouseover
output$tails = renderUI({
  tailimgs <- lapply(df()$tailimage, function(file){
    tags$div(
      tags$img(src=file, width="100%", height="100%"),
      tags$script(src="titlescript.js")
    )
    
  })
  do.call(tagList, tailimgs)
})