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
                      hr(),
                      h2("Instruction to complete a Cooper 12 min walk Test"),
                      hr(),
                      h3("Required Resources"),
                      hr(),
                      h4("To undertake this test you will require:"),
                      hr(),
                      p(" 1. 400 metre track"),
                      p(" 2. Stopwatch:"),
                      p(" 3. Whistle:"),
                      p(" 4. Assistant"),
                      hr(),
                      h3("How to conduct the test"),
                      hr(),
                      h4("This test requires the athlete to run as far as possible in 12 minutes."),
                      hr(),
                      p(" 1. The athlete warms up for 10 minutes"),
                      p(" 2. The assistant gives the command “GO”, starts the stopwatch and the athlete commences the test"),
                      p(" 3. The assistant keeps the athlete informed of the remaining time at the end of each lap (400m)"),
                      p(" 4. The assistant blows the whistle when the 12 minutes has elapsed and records the distance the athlete covered to the nearest 10 metres"),
                      hr(),
                      h3("How to use the Shiny Application to calculate an Athletes V02 max"),
                      hr(),
                      p(" 1. On the the Left Sidebar Panel use the Radio button to select the Gender of the Athlete, The Data table will be updated to reflect the values based on Gender."),
                      p(" 2. From the Drop-down list select the Age category of the Athlete. The table will show the Level of fitness Groups for the Age selected."),
                      p(" 3. Enter the Distance completed during the 12 min test by the Athlete."),
                      p(" 4. Press the Calculate button to calculate the V02 max value. The applicion (Server.R) will calculate the V02 max and display the value."),
                      p(" 5. To recalculate any values, Retart the instructions at point 1")
             ),
             tabPanel("Back ground",
                      hr(),
                      h2("What is a V02 max Test"),
                      hr(),
                      h3("Description"),
                      p("Fitness and and Level of fitness could be quantifier by evaluating a athletes VO2 max value. VO2 max, or also known as maximal oxygen uptake is a factor that indicate an athletes capacity to perform sustained exercise and is linked to an individual's aerobic endurance. It is the maximum amount of oxygen an individiual can utilize during maximal exercise. It is generally considered as an indicator of an athlete's cardiovascular fitness. Endurance athletes such as marathon runners and elite cyclist usually have higher values than the normal population's values."),
                      h3("How is V02 max measured"),
                      p("To accurately measure V02 max generally requires equipment and gas analyser instruments typically found in High Performance sport laboratories. Test are performed under strict protocal amnd requires maximum effort from an athlete. Oxygen consumption rises in a linear relationship with exercise intensity --up to a point. This plateau marks the V02 max point. From that point it is not long that muscle fatique forces and athlete to stop exercising."),
                      hr(),
                      h3("Source"),
                      hr(),
                      p("COOPER, K.H. (1968) A means of assessing maximal oxygen intake. JAMA. 203, p. 135-138")
             ),
             tabPanel("Github repository",
                      hr(),
                      a("https://github.com/mtbbiker/dp_shiny"),
                      hr(),
                      h4("All source and data can be found in the above link")
             )
  )
)
