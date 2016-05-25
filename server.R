#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#

# Find out more about sliderInput('mu', 'Guess at the mean',value = 70, min = 62, max = 74, step = 0.05,)building applications with Shiny here:

# Find out more about building applications with Shiny here:

# 
#    http://shiny.rstudio.com/
#


library(UsingR)

myfiledatamale <- read.csv("data/maledata.csv", colClasses = "character")
myfiledatafemale <- read.csv("data/femaledata.csv", colClasses = "character")

vo2max <- function(distance) (distance - 504.9) / 44.73

shinyServer(
  
  
  
  function(input, output) {
    
    output$mytable = renderDataTable({

        if(input$radioGender==1)
        {
          #output$text1 <-renderText("Male")

          if(input$varAge=="ALL")
          {
            myfiledatamale[]
          }
          else
          {
            myfiledatamale[myfiledatamale$Age==input$varAge,,drop =FALSE]
            output$testresult <- renderText("Excellent !")
          }
        }
        else
        {
          #output$text1 <-renderText("Female")
          if(input$varAge=="ALL")
          {
            myfiledatafemale[]
          }
          else
          {
            myfiledatafemale[myfiledatafemale$Age==input$varAge,,drop =FALSE]
            output$testresult <- renderText("Poor !")
          }
        }
    })
    
    output$vo2max <- renderText({
      
      #if (input$goButton == 0) "You have not calculated anything"
      #    else paste(vo2max(input$numDist), " mls/kg/min")
      
      input$goButton
      isolate(
        vo2max(input$numDist)
      )
    })
    
    #output$text1 <- renderText({
      
    #})

#    output$newHist <- renderPlot({
      
    #hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
#     hist(smalldata$Global_active_power, col = "orange",main = "Histogram",xlab = "Global Active Power(kilowatts)")
#      mu <- input$mu
#      lines(c(mu, mu), c(0, 200),col="red",lwd=5)
#      mse <- mean((smalldata$Global_active_power - mu)^2)
#      text(63, 150, paste("mu = ", mu))
#      text(63, 140, paste("MSE = ", round(mse, 2)))
#    })
    
  }
)


