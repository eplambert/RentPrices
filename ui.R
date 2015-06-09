library(shiny)

# Define the UI for the application
shinyUI(fluidPage(
          # Application Title
          titlePanel("How much Rent for a given Square Foot"),
          
          # Sidebar with a slider input for the number of bins
          sidebarLayout(
                    sidebarPanel(
                              helpText("This tool uses a linear model to predict the rental price of an apartment in Seattle, Wa. given the Square foot input."),
                              
                              sliderInput("squareft",
                                          "Square feet:",
                                          min = 200,
                                          max = 1500,
                                          value = 850),
                              
                              textOutput('text1')
                    ),
                    mainPanel(
                              plotOutput('plot1')
                              
                    )
          )
))