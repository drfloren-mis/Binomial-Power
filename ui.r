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
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Binomial Power"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("null",
                  "P Under H0:",
                  min = 0,
                  max = 1,
                  value = 0.05,
                  step=0.01),
      sliderInput("alt",
                  "P Under H1:",
                  min = 0,
                  max = 1,
                  value = 0.4,
                  step=0.01),
      sliderInput("alpha",
                  "Value for Alpha:",
                  min=.001,
                  max=0.2,
                  value=0.05, 
                  step=0.01)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
