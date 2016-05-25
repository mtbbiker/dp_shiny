#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

#Set x <- 0 before running

x <<- x + 1
y <<- 0

shinyServer(
  function(input, output) {
    y <<- y + 1
    output$txtdistance <- renderText({input$txtDistance})
    output$txtGender <- renderText({input$txtGender})
    output$text3 <- renderText({as.numeric(input$txtDistance)+1})
    output$text4 <- renderText(y)
    output$text5 <- renderText(x)
    output$text5 <- renderText({ 
      paste("You have selected", input$var)
    })
    output$text4 <- renderText({ 
      paste("You have selected", input$var2)
    })
  }
)