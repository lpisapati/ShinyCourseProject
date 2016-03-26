
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
    
    ## generate GGplot based on the values selected from ui.R w.r.t Cylider and Gear values.
    p <- ggplot(values(), aes_string(x=input$cyl, y=input$gear)) + geom_point()
    ## set the colo output
    p <- p + aes_string(color=input$cyl)
    # define facets
    facets <- paste(input$cyl, '~', input$gear)
    if (facets != '. ~ .')
      p <- p + facet_grid(facets)
    
    ## reset the ggplot with jitter value, if selected
    if (input$jitter)
      p <- p + geom_jitter()
    ## reset the ggplot with smooth value, if selected
    if (input$smooth)
      p <- p + geom_smooth()
    
    print(p)
    
  }, height=700)

})
