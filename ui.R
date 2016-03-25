
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)


#cyltypes <- sort(unique(values$cyl))
#geartypes <- sort(unique(values$gear))

shinyUI(fluidPage(

  # Application title
  titlePanel("Motor Cars Data Project"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput('cyl', 'Cylinders', c(4,6,8)),
      selectInput('gear', 'Gear', c(3,4,5)),
      #selectInput('cyl', 'Cylinders', cyltypes),
      #selectInput('gear', 'Gear', geartypes),
      checkboxInput('jitter', 'Jitter'),
      checkboxInput('smooth', 'Smooth')
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot")
    )
  )
  #,
  
  
#  tabPanel("About",
#           mainPanel(
#             includeMarkdown("about.md")
#           )
#  )
))
