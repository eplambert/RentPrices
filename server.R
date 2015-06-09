# Server side script contains code needed to run the application
library(shiny)
library(ISLR)
library(ggplot2)
library(caret)

#perform analysis first
Data <- read.csv("rentdata.csv")
rentalData <- data.frame(Data$squareft, Data$price)

# Define server logic
shinyServer(function(input, output){
          #need to display output
          
          output$text1 <- renderText({
                    # Construct the model
                    modelFit <- train(Data.price ~ Data.squareft, data=rentalData, method="lm")
                    # Make the prediction
                    prediction <- predict(modelFit, newdata = (Data.squareft = input$squareft))
                    # perform Truncation
                    prediction <- trunc(prediction)
                    #Construct the output
                    paste("Predicted rental cost is $", prediction)
          })
          
          output$plot1 <- renderPlot ({
                    ggplot(rentalData, aes(x=Data.squareft, y=Data.price)) +
                              geom_point(shape=1) +    
                              geom_smooth(method=lm)
          })
})