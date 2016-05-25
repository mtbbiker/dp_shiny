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

shinyUI(pageWithSidebar(
  headerPanel("Cooper 12 min Walk VO2max Test"),
  sidebarPanel(
    #sliderInput('mu', 'Guess at the mean',value = 70, min = 62, max = 74, step = 0.05,)
    selectInput("varAge", 
                label = h3("Select Age") ,
                choices = c("ALL","13-14", "15-16",
                            "17-19", "20-29","30-39","40-49",">50"),
                selected = "ALL"),
    numericInput("numDist",label = h3("Distance walked in meters"), value = 1000),
    radioButtons("radioGender", label = h3("Select Gender"),
                 choices = list("Male" = 1, "Female" = 2),selected = 1),
    actionButton("goButton", "Calculate!")
    
    #,sliderInput('mu', 'Guess at the mean',value = 3, min = 0, max = 7, step = 0.5,)
    
  ),
  mainPanel(
    h2('Range of data for Age'),
    
    dataTableOutput('mytable'),
    
    h2('Comparative Result'),
    textOutput('text1')
    #,plotOutput('newHist')
    

  )
))
