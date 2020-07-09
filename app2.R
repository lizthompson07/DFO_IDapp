library (shinydashboard)
library(shiny)
library(DT)


# ---- DASHBOARD ----
ui <- dashboardPage(
  
  dashboardHeader(title = "GULF NARW IDapp"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Info", tabName = "infotab"),
      menuItem("Heads", tabName = "heads"),
      menuItem("Tails", tabName = "tails"),
      menuItem("Heads&Tails", tabName = "headsandtails")
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "infotab",
              "info"),
      tabItem(tabName = "heads",
              "heads"),
      tabItem(tabName = "tails",
              "tails"),
      tabItem(tabName = "headsandtails",
              source('./test.R', local = TRUE)$value)
    )
  )
)
  

server = function(input, output, session) {
  
}

shinyApp(ui, server)
