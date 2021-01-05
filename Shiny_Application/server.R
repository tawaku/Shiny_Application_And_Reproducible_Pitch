#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Load data and visualization libraries
data('USArrests')
library(factoextra)

# Scale data in advance
ds <- scale(USArrests)

# Define server logic required to draw clusters
shinyServer(function(input, output) {

    output$plot <- renderPlot({

        # validate input$clusters
        if(input$clusters < 1) { input$clusters <- 1 }
        if(input$clusters > 10) { input$clusters <- 10 }
        
        # generate clusters based on input$clusters from ui.R
        result <- kmeans(ds, input$clusters, nstart = 25)

        # draw the cluster plot with the specified number of clusters
        fviz_cluster(result, data = ds)

    })

})
