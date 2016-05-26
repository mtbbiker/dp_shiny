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

shinyUI(
  navbarPage("Cooper V02max 12 min walk Test calculator",
             tabPanel("Calculator",
                      pageWithSidebar(
                        headerPanel(h3("Data Input")),
                        sidebarPanel(
                          #sliderInput('mu', 'Guess at the mean',value = 70, min = 62, max = 74, step = 0.05,)
                          radioButtons("radioGender", label = h3("Select Gender"),
                                       choices = list("Male" = 1, "Female" = 2),selected = 1),
                          
                          selectInput("varAge", 
                                      label = h3("Select Age") ,
                                      choices = c("ALL","13-14", "15-16",
                                                  "17-19", "20-29","30-39","40-49",">50"),
                                      selected = "ALL"),
                          numericInput("numDist",label = h3("Distance walked in meters"), value = 0),
                          
                          actionButton("goButton", "Calculate!")
                          
                          #,sliderInput('mu', 'Guess at the mean',value = 3, min = 0, max = 7, step = 0.5,)
                          
                        ),
                        mainPanel(
                          h2('Range of data for Age'),
                          
                          dataTableOutput('mytable'),
                          h3('Results for walking Distance:'),
                          h2(textOutput('testresult')),
                          h2('Estimated VO2max:'),
                          h2(textOutput('vo2max'))
                          #,plotOutput('newHist')
                          
                          
                        )
                      )
             ),
             tabPanel("Instructions",
                      h2("Instruction to complete a Cooper 12 min walk Test"),
                      hr(),
                      h3("Here : Peer Assessments /Regression Models Course Project"),
                      helpText("You work for Motor Trend, a magazine about the automobile industry Looking at a data set of a collection of cars, they are interested in exploring the relationship",
                               "between a set of variables and miles per gallon (MPG) (outcome). They are particularly interested in the following two questions: Is an automatic or manual transmission better for MPG. Quantify the MPG difference between automatic and manual transmissions"),
                      h3("Important"),
                      p("A data frame with 32 observations on 11 variables."),
                      
                      a("https://class.coursera.org/regmods-008")
             ),
             tabPanel("Back ground",
                      h2("What is a V02 max Test"),
                      hr(),
                      h3("Description"),
                      helpText("The data was extracted from the 1974 Motor Trend US magazine,",
                               " and comprises fuel consumption and 10 aspects of automobile design and performance",
                               " for 32 automobiles (1973–74 models)."),
                      h3("Format"),
                      p("A data frame with 32 observations on 11 variables."),
                      
                      p("  [, 1]   mpg         Miles/(US) gallon"),
                      p("  [, 2]	 cyl	 Number of cylinders"),
                      p("  [, 3]	 disp	 Displacement (cu.in.)"),
                      p("  [, 4]	 hp	 Gross horsepower"),
                      p("  [, 5]	 drat	 Rear axle ratio"),
                      p("  [, 6]	 wt	 Weight (lb/1000)"),
                      p("  [, 7]	 qsec	 1/4 mile time"),
                      p("  [, 8]	 vs	 V/S"),
                      p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                      p("  [,10]	 gear	 Number of forward gears"),
                      p("  [,11]	 carb	 Number of carburetors"),
                      
                      h3("Source"),
                      
                      p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411.")
             ),
             tabPanel("Github repository",
                      a("https://github.com/mtbbiker/dp_shiny"),
                      hr(),
                      h3("All source and data can be found in the above link")
             )
  )
)
