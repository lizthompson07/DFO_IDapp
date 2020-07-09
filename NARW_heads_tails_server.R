# ---- Data File ----
dat <- read.csv(file="./coding02July2020.csv")

# ---- Server ----

output$table <- renderDT({
  datatable(dat, filter = "top", options = list(
    autowidth=TRUE,
    columnDefs = list(list(width = '185px', targets = list(7,8,9,10)),
                      list(className = 'dt-center', targets = '_all'),
                      list(visible=FALSE, targets=c(0,10,11))),
    pageLength = 6,
    lengthMenu = c(6, 12, 18, 24, 30, 42, 58)
  ))
})

df <- reactive({
  dat[input[["table_rows_current"]], ]
})

output$images <- renderUI({
  imgs <- lapply(df()$whaleimage, function(file){
    tags$div(
      tags$img(src=file, width="100%", height="100%"),
      tags$script(src="titlescript.js")
    )
    
  })
  do.call(tagList, imgs)
})

output$tails <- renderUI({
  tailimgs <- lapply(df()$tailimage, function(file){
    tags$div(
      tags$img(src=file, width="100%", height="100%"),
      tags$script(src="titlescript.js")
    )
    
  })
  do.call(tagList, tailimgs)
})