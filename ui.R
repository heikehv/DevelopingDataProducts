library(shiny)
library(plotly)
library(ggplot2)

judges2 <- read.csv("data/judges.csv", sep=",", header=TRUE)

nms <- names(judges2)

ui <- fluidPage(
  
  headerPanel("Exploring the behaviour of US Judges"),
  sidebarPanel(
    p("Select from the options below to find out how US Judges have been rated by various lawyers."),
    selectInput('x', 'To be displayed on x-axis', choices = nms, selected = "Contact"),
    selectInput('y', 'To be displayed on y-axis', choices = nms, selected = "Integrity"),
    selectInput('color', 'To be depicted by colour', choices = nms, selected = "Names"),
    p("You can also select a smaller sample if you wish and resize the plot window."),
    sliderInput('sampleSize', 'Sample Size', min = 1, max = nrow(judges2),
                value = 50, step = 1, round = 0),
    # selectInput('facet_row', 'Facet Row', c(None = '.', nms), selected = "clarity"),
    # selectInput('facet_col', 'Facet Column', c(None = '.', nms)),
    sliderInput('plotHeight', 'Height of plot (in pixels)', 
                min = 100, max = 500, value = 1000)
  ),
  mainPanel(
    plotlyOutput('trendPlot', height = "900px")
  )
)