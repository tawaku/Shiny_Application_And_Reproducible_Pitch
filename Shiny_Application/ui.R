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
    titlePanel('K-means Clustering - US Arrests'),
    
    # Application description
    h3('how to use this app.'),
    p('This app shows clusters for arrests per 100,000 residents for assault, murder, and rape in each of the 50 US states in 1973. 4 variables are compressed with PCA to draw as plot.'),
    p('You can configure the number of clusters by changing the slider in side navigation.'),

    # Sidebar with a slider input for number of clusters
    sidebarLayout(
        sidebarPanel(
            sliderInput('clusters',
                        'Number of clusters:',
                        min = 1,
                        max = 10,
                        value = 5)
        ),

        # Show a plot of the generated clusters
        mainPanel(
            plotOutput('plot')
        )
    )
))
