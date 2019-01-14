#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    numred <- sum(pbinom(0:10, 10, input$null) < (1-input$alpha)) + 1 #how many are below the cutoff? +1
    
    x <- 0:10
    y <- dbinom(x,10,input$alt)
    xx <- barplot(height = y, space = 0, names.arg = x, ylim=c(0, max(y)+.15*max(y)), col = c(rep("white",numred), rep("red", length(x)-numred)), main=paste0("Red is ", round(sum(y[-(1:3)]),3)*100,"%"))
    text(x=xx, y=y, label = round(y,4), pos=3)
    abline(v=numred, lwd=3, col="red")
  })
  
})
