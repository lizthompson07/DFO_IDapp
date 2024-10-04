# --- CSS ----
css <-
  "
table, th, td {
  border: 1px solid black;
}

img {
  float: left; 
  width: 30%; 
  margin-right: 1%; 
  margin-bottom: 0.5em; 
  height: 350px;
}

.nav-tabs {
  font-family: 'Lucida Sans', sans-serif;
  font-weight: bold;
}

#pictabs {
  padding-top:25px;
}
"

# ---- UI ----
fluidPage(
  titlePanel("Search for Heads and Tails"),
  setBackgroundColor("skyblue"),
 
  
  # Add the radio button selection with inline styling
  tags$div(
  radioButtons("region_choice", "Select a region:",
               choices = list("GSL" = "gslchoice", "BoF" = "bofchoice"),
               selected = "gslchoice", inline = TRUE),
  style = "display: inline-block; border: 2px solid #000; padding: 10px; margin-bottom: 20px; justify-content: left;"
  ),

  mainPanel(
      width = 12,
      tags$style(css),
      DTOutput("table"),
      actionButton("select_all_current", "Select All Rows in View"),
      actionButton("add_to_selection", "Add All Rows in View to Selection"),
      actionButton("select_clear", "Clear Selection"),
      actionButton("filter_clear", "Clear Filter"),
      tags$script(src = "clearfilter.js"),

  fluidRow(id = "pictabs",
    tabsetPanel(
      tabPanel('Heads',
        uiOutput("images")),
      
      tabPanel('Tails',
        uiOutput("tails")),
      
      tabPanel('Ventral Tail',
        uiOutput("ventrals")),
      
      tabPanel('Left Side',
        uiOutput("lefts")),
      
      tabPanel('Right Side',
        uiOutput("rights"))
      )
    )
  )
# to put heads and tails side by side  
   # fluidRow(
   # column(4, uiOutput("images")),
   #  column(4, uiOutput("tails")),
   #  )
  )

