# --- CSS ----
css <-
  "
table, th, td {
  border: 1px solid black;
}

img {
  float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em; height: 350px;
 }
"

# ---- UI ----
fluidPage(
  titlePanel("Search for Heads and Tails"),
 
  mainPanel(
    width = 12,
    tags$style(css),
    DTOutput("table"),
    actionButton("select_all", "Select All"),
    actionButton("select_clear", "Clear Selection"),
    actionButton("filter_clear", "Clear Filter"),
    tags$script(src = "clearfilter.js"),

    uiOutput("images"),
    uiOutput("tails")
  )
)
