#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
<<<<<<< HEAD
shinyUI(pageWithSidebar(
  headerPanel("Example plot"),
  sidebarPanel(
    #sliderInput('mu', 'Guess at the mean',value = 70, min = 62, max = 74, step = 0.05,)
    sliderInput('mu', 'Guess at the mean',value = 3, min = 0, max = 7, step = 0.5,)
  ),
  mainPanel(
    plotOutput('newHist')
=======
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
>>>>>>> b17e530d513ff6ad5c61be256feb8ce4fa977e51
  )
))
