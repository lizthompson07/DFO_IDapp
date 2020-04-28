library(shiny)
library(DT)

# getwd()
# setwd("C:/Users/ThompsonE/Documents/Projects/NOAA Surveys/IDapp/Latest/www")
dat <- read.csv(file="./codingAug7.csv")


ui <- fluidPage(theme = "stylesheet.css",
  DTOutput("table"),
  uiOutput("images"),
  
    h1("Legend"),
    
    tags$table(style = "padding: 5%; width: 15%;",
               
    tags$tr(
            tags$th("Acronym"),
            tags$th("Definition")
    ),
    tags$tr(
      tags$td("asym"),
      tags$td("Asymmetrical")
      
    ),
    tags$tr(
            tags$td("B"),
            tags$td("Broken")
  
    ),
    tags$tr(
      tags$td("C"),
      tags$td("Continuous")
      
    ),
    tags$tr(
      tags$td("coam"),
      tags$td("Coaming")
      
    ),
    tags$tr(
      tags$td("dbl"),
      tags$td("Double")
      
    ),
    tags$tr(
      tags$td("isl"),
      tags$td("Island")
      
    ),
    tags$tr(
      tags$td("L"),
      tags$td("Left")
      
    ),
    tags$tr(
      tags$td("PB"),
      tags$td("Post Blowholes")
      
    ),
    tags$tr(
      tags$td("pen"),
      tags$td("Peninsula")
      
    ),
   
    tags$tr(
      tags$td("R"),
      tags$td("Right")
      
    ),
  
    tags$tr(
      tags$td("sym"),
      tags$td("Symmetrical")
      
    ),
    tags$tr(
      tags$td("w"),
      tags$td("with")
      
    )
  
)
)

server <- function(input, output){
  
  output[["table"]] <- renderDT({
    datatable(dat, filter = "top", options = list(
      autowidth=TRUE,
      columnDefs = list(list(width = '185px', targets = list(7,8,9,10)),
                        list(className = 'dt-center', targets = '_all'),
                        list(visible=FALSE, targets=c(0,10))),
      pageLength = 5,
      lengthMenu = c(5, 10, 15, 20)
           ))
  })
  
  df <- reactive({
    dat[input[["table_rows_current"]], ]
  })
  
  output[["images"]] <- renderUI({
    imgs <- lapply(df()$whaleimage, function(file){
      tags$div(
        tags$img(src=file, width="100%", height="100%"),
        tags$script(src="titlescript.js")
      )
    })
    do.call(tagList, imgs)
  })
  
}


shinyApp(ui, server)