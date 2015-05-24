library(shiny)
library(datasets)
data(eurodist)

shinyServer(function(input, output) {
  
  output$distancePlot <- renderPlot({
    par(mar=c(4,6,2,2))
    barplot(sort((as.matrix(eurodist)[,input$origin]), decreasing=TRUE), 
            main=paste("Road Distances from", input$origin),
            xlab="Road Distance from Origin (in km)", , col="blue", xlim=c(0,5000),
            horiz = TRUE, cex.names=0.75, cex.main=1.5, las=1, space=0.5)
  })
  output$distanceTable <- renderTable({
    as.matrix(eurodist)
  })
})


