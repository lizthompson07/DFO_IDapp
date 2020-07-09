library (shinydashboard)
library(shiny)
library(DT)


# ---- DASHBOARD ----
ui <- fluidPage(

  titlePanel("GULF NARW IDapp"),

  mainPanel(
    width = 12,
    fluidRow(
    tabBox(
      title = NULL, width = 12,
      # The id lets us use input$tabset1 on the server to find the current tab
      id = "tabset1", height = "500px",
    tabPanel("Info", source('./info.R')),
    tabPanel("Heads", "Head tab"),
    tabPanel("Tails", "Tail tab"),
    tabPanel("Head and Tails", source('./headsandtails.R'))
  )
  ),
))
  
  server = function(input, output, session) {
    
  }

  shinyApp(ui, server)
