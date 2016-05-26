---
### Your Shiny Application

1. Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
2. Deploy the application on Rstudio's shiny server
3. Share the application link by pasting it into the text box below
4. Share your server.R and ui.R code on github
5. The application must include the following:
- Some form of input (widget: textbox, radio button, checkbox, ...)
- Some operation on the ui input in server.R
- Some reactive output displayed as a result of server calculations
- You must also include enough documentation so that a novice user could use your application.
- The documentation should be at the Shiny website itself. Do not post to an external link.

The Shiny application in question is entirely up to you. However, if you're having trouble coming up with ideas, you could start from the simple prediction algorithm done in class and build a new algorithm on one of the R datasets packages. Please make the package simple for the end user, so that they don't need a lot of your prerequisite knowledge to evaluate your application. You should emphasize a simple project given the short time frame.  

## Background - Cooper VO2 max test [Link](http://www.brianmac.co.uk/gentest.htm)

Fitness and and Level of fitness could be quantifier by evaluating a athletes VO2 max value. VO2 max, or also known as maximal oxygen uptake is a factor that indicate an athletes capacity to perform sustained exercise and is linked to an individual's aerobic endurance. It is the maximum amount of oxygen an individiual can utilize during maximal exercise. It is generally considered as an indicator of an athlete's cardiovascular fitness. Endurance athletes such as marathon runners and elite cyclist usually have higher values than the normal population's values.


### How is V02 max measured

To accurately measure V02 max generally requires equipment and gas analyser instruments typically found in High Performance sport laboratories. Test are performed under strict protocal amnd requires maximum effort from an athlete. Oxygen consumption rises in a linear relationship with exercise intensity --up to a point. This plateau marks the V02 max point. From that point it is not long that muscle fatique forces and athlete to stop exercising.

### The Cooper walking Test[1]

The Cooper Test was developed to estimate an Athletes VO2 max and provide a simple way of testing athletes for subsequent performance evaluations.

#### Required Resources

To undertake this test you will require:

  *  400 metre track
  *  Stopwatch
  *  Whistle
  *  Assistant

#### How to conduct the test

This test requires the athlete to run as far as possible in 12 minutes.

 *    The athlete warms up for 10 minutes
 *    The assistant gives the command “GO”, starts the stopwatch and the athlete commences the test
 *    The assistant keeps the athlete informed of the remaining time at the end of each lap (400m)
 *    The assistant blows the whistle when the 12 minutes has elapsed and records the distance the athlete covered to the nearest 10 metres

### How to use the Shiny Application to calculate an Athletes V02 max

1. On the the Left ```Sidebar Panel``` use the ```Radio button``` to select the Gender of the Athlete, The Data table will be updated to reflect the values based on Gender.
2. From the ```Drop-down``` list select the Age category of the Athlete. The table will show the Level of fitness Groups for the Age selected.
3. Enter the Distance completed during the 12 min test by the Athlete.
4. Press the ```Calculate``` button to calculate the V02 max value. The applicion (Server.R) will calculate the V02 max and display the value.
5. To recalculate any values, Retart the instructions at point 1.



####References

    1. COOPER, K.H. (1968) A means of assessing maximal oxygen intake. JAMA. 203, p. 135-138



