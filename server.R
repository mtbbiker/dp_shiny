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
#data(galton)

#library(data.table)
#datafile <- "household_power_consumption.txt"
## Get the Training Data
#pol_data <- read.table(datafile,sep=";",header = TRUE)

#library(dplyr)
#x <- filter(pol_data, Date >= "2007-02-01" , Date  <= "2007-02-02")
##Convert to POSIX Date and format
#pol_data$Date <- as.Date(strptime(pol_data$Date,"%d/%m/%Y"),"%Y-%m-%d" )
##pol_data$Date <- strptime(pol_data$Date,"%d/%m/%Y")

##Format text to be coerced to numerics later
#pol_data$Global_active_power <- as.numeric(gsub(",","",pol_data$Global_active_power))
##pol_data$Global_active_power <- as.numeric(pol_data$Global_active_power)

#smalldata <- subset(pol_data, Date >= "2007-02-01" & Date <= "2007-02-02")
#smalldata$Global_active_power <- as.numeric(smalldata$Global_active_power)

##hist(as.numeric(smalldata$Global_active_power), col = "orange",breaks = 100)
##hist(smalldata$Global_active_power, col = "orange",main = "Global Active Power",xlab = "Global Active Power(kilowatts)")

shinyServer(
  function(input, output) {
    output$newHist <- renderPlot({
      
      #hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
      hist(smalldata$Global_active_power, col = "orange",main = "Histogram",xlab = "Global Active Power(kilowatts)")
      mu <- input$mu
      lines(c(mu, mu), c(0, 200),col="red",lwd=5)
      mse <- mean((smalldata$Global_active_power - mu)^2)
      text(63, 150, paste("mu = ", mu))
      text(63, 140, paste("MSE = ", round(mse, 2)))
    })
    
  }
)
