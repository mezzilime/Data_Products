library(UsingR)
library(shiny)
library(datasets)

data(eurodist)
eurodist <- as.matrix(eurodist)

shinyUI(
  fluidPage(    
    titlePanel("How far is my trip?"),
    sidebarLayout(      
      sidebarPanel(
        selectInput("origin", "Select Origin:", 
                    choices=colnames(eurodist)),
        hr(),

        helpText("Data from Crystal, D. Ed. (1990) The Cambridge Encyclopaedia. Cambridge: Cambridge University Press.")
      ),
      
      mainPanel(
        tabsetPanel(
          tabPanel("Plot", h4("Barplot of Distances"), plotOutput("distancePlot")),
          tabPanel("Table", h4("Matix Table of Distances"), tableOutput("distanceTable")),
          tabPanel("Documentation", h4("Documentation for this App"), includeMarkdown("DistanceDocs.Rmd"))
        )
      )
    )
  )
)


  
  