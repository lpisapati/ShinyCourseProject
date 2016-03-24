
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

# Plotting 
library(ggplot2)

# Required by includeMarkdown
library(markdown)

# Load data
data("mtcars")
cyltypes <- sort(unique(mtcars$cyl))
geartypes <- sort(unique(mtcars$gear))

shinyServer(function(input, output) {

  values <- reactive(mtcars)
  
  output$plot <- renderPlot({
    
    p <- ggplot(values(), aes_string(x=input$cyl, y=input$gear)) + geom_point()
    
    #if (input$color != 'None')
      p <- p + aes_string(color=input$cyl)
    
    facets <- paste(input$cyl, '~', input$gear)
    if (facets != '. ~ .')
      p <- p + facet_grid(facets)
    
    if (input$jitter)
      p <- p + geom_jitter()
    if (input$smooth)
      p <- p + geom_smooth()
    
    print(p)
    
  }, height=700)

})
