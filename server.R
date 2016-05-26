#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(UsingR)

myfiledatamale <- read.csv("data/maledata.csv", colClasses = "character")
myfiledatafemale <- read.csv("data/femaledata.csv", colClasses = "character")
catagories <- names(myfiledatamale)


#Calculate the Estimated VO2max
vo2max <- function(distance) (distance - 504.9) / 44.73

test <- function(testdata,dist)
{
  result <- ""
  for (i in 2:length(catagories)) {
    
    a <- strsplit(testdata[,i],"-")
    
    print(a)
    
    ll <- length(a[[1]])
    
    if(ll==1)
    {
      ##Single
      lower <- sapply(a, function(x){as.numeric(x[1])})
      print(lower)
      if(dist > lower)
      {
        #High value
        print("Match Upper bound")
        result <- catagories[i]
        break
      } else 
      {
        #Test more
        print("Match Lower bound")      
        result <- catagories[i]
        
      }
    } else
    {
      ##Upper and lower val
      lower <- sapply(a, function(x){as.numeric(x[1])})
      upper <- sapply(a, function(x){as.numeric(x[2])})
      if((lower <= dist) & (upper >= dist )) #Test more
      {
        print("Match multi")
        result <- catagories[i]
        break
      } 
      else 
      {
        print("Test More Multi")
      } 
    }
  }
  result
}

compaDistance <- function(agegroup,sex,distance) {
  if(sex == 1)
  {
    #Use Male data
    usedata <- myfiledatamale[myfiledatamale$Age==agegroup,,drop =FALSE]
    #head(usedata)
    t <- test(usedata,distance)
    
    
    paste(t, " Results for distance", distance, " m walked")
    
  }
  else
  {
    #Use Female Data
    usedata <- myfiledatafemale[myfiledatafemale$Age==agegroup,,drop =FALSE]
    t <- test(usedata,distance)
    paste(t," Results for distance", distance, " m walked")
  }
  
}


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
          }
        }
    })
    
    output$vo2max <- renderText({
      
      #if (input$goButton == 0) "You have not calculated anything"
      #    else paste(vo2max(input$numDist), " mls/kg/min")
      
      input$goButton
      isolate(
        if(input$numDist>0)
        {
          paste(round(vo2max(input$numDist), digits = 3) , " mls/kg/min")
        }
        else
        {
          "0.00 mls/kg/min"
        }
        
      )
    })
    
    output$testresult <- renderText({
      
      input$goButton
      isolate(
          
          if (input$goButton <= 0) "Not Calculated yet !"
          
          else 
            {
              input$goButton
              compaDistance( input$varAge,input$radioGender,input$numDist)
            }
        )
      })
  }
)


