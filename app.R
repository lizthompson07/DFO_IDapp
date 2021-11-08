#################################
## NARW Head and Tails App     ##
## By: Liz Thompson            ##  
## Last updated: Nov 8, 2021 ##
#################################

library(shinydashboard)
library(shiny)
library(DT)
library(shinyWidgets) #used for setBackgroundColor in ui

# ---- User Interface ---

ui = source('./NARW_images_ui.R', local = TRUE)$value

# ---- Server ----

server = function(input, output, session){
  
  source('./NARW_heads_tails_server.R', local = TRUE)$value

  }

# ---- ShinyApp ----
shinyApp(ui, server)