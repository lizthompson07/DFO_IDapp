For helping to identify whales quickly in the Gulf Region

Dependencies include library(shiny), library(DT), and library(shinydashboard)

You must also have all the headshots, the stylesheet.css, and the titlescript.js in a folder called 'www' in the same directory as you have the app.R.

Happy whale ID'ing :whale:

# Local install (for when you have no internet)
**Step 1:**
You will need to have R and R Studio installed, available online.

**Step 2:**
From this repository click on green button "Code" and "Download ZIP". Extract zip folder where you want to run program from then load the three files with .R extensions into R Studio. 

**Step 3a:**
Open R Studio and open the three .R files you just saved in a new workspace. 

**Step 3b:**
On first install you may also need to manually install the following packages by running (you may get a banner at the top you can install by clicking on also):
- install.packages("shiny")
- install.packages("DT")
- install.packages("shinydashboard")
- install.packages("shinyWidgets")

**Step 4:**
From app.R click the small triangle beside "Run App" and choose 'Run External', then click "Run App". 

# Local install updates
The easiest way to do this unless you are familiar with Git, is by coming back to this respository and downloading the zip folder again (Step 2 above) and unzipping it in the directory where you saved the app and allowing it to overwrite files. 


# Running the app remotely (when you have internet connection)
The app can be launched by entering shiny::runGitHub("DFO_IDapp", username = "lizthompson07", ref = "master", launch.browser = TRUE) into the Console window and hitting “Run App” under the app.R window in top left of RStudio environment.
