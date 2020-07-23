For helping to identify whales quickly in the Gulf Region

Dependencies include library(shiny), library(DT), and library(shinydashboard)

You must also have all the headshots, the stylesheet.css, and the titlescript.js in a folder called 'www' in the same directory as you have the app.R.

Happy whale ID'ing :whale:

# Local install
You will need to have R and R Studio installed, available online.

On first install you will also need to install the following packages by running:
- install.packages("shiny")
- install.packages("DT")
- install.packages("shinydashboard")

From this repository click on green button "Code" and "Download ZIP". Extract zip folder where you want to run program from then load the three files with .R extensions into R Studio. 

From app.R click the small triangle beside "Run App" and choose 'Run External', then click "Run App". 

# Running the app remotely
The app can be launched by running shiny::runGitHub("DFO_IDapp", username = "lizthompson07", ref = "master") in your RStudio environment.
