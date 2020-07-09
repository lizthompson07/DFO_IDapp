####################
##     INFO       ##
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

# ---- UI ----
ui <- fluidPage(
                
titlePanel("How to Use this App"),

mainPanel(

tags$style(css),
tags$p("Insert text here"),

tags$h1("Legend"),

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
)

# ---- SERVER ----

server <- function(input, output, session){
  
}

shinyApp(ui, server)