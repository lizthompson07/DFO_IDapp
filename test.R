####################
## Head and Tails ##
####################

library(shiny)
library(DT)

css <-
  "
table, th, td {
  border: 1px solid black;
}

img {
  float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em; width: 500px; height: 350px;
 }
"

# ---- Data File ----
dat <- read.csv(file="./coding02July2020.csv")

# ---- UI ----
ui <- fluidPage(
  titlePanel("Search for Heads and Tails"),
  mainPanel(
    width = 12,
    tags$style(css),
    DTOutput("table"),
    uiOutput("images"),
    uiOutput("tails"),
  )
)

# ---- Server ----
server <- function(input, output, session){
  
  output[["table"]] <- renderDT({
    datatable(dat, filter = "top", options = list(
      autowidth=TRUE,
      columnDefs = list(list(width = '185px', targets = list(7,8,9,10)),
                        list(className = 'dt-center', targets = '_all'),
                        list(visible=FALSE, targets=c(0,10,11))),
      pageLength = 5,
      lengthMenu = c(5, 10, 15, 20, 40, 60)
    ))
  })
  
  df <- reactive({
    dat[input[["table_rows_current"]], ]
  })
  
  test <- function(file){
    tags$div(
      tags$img(src=file, width="100%", height="100%"),
      tags$script(src="titlescript.js")
    )
    
  } 
  
  output[["images"]] <- renderUI({
    imgs <- mapply(test, df()$whaleimage)
    do.call(tagList, imgs)

  })
  
  output[["tails"]] <- renderUI({
      tails <- mapply(test, df()$tailimage)
      do.call(tagList, tails)
      
    })

}

# ---- ShinyApp ----
shinyApp(ui, server)