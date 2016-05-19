
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com


library(shiny)
library(ggplot2)

#Load Data
data("ChickWeight")

#generate list of itens for the combo box input
diet_list <- unique(ChickWeight$Diet)

shinyServer(function(input, output) {

  # draw the histogram for the specified Diet
  output$weight_time_plot <- renderPlot({

    qplot(data = subset(ChickWeight, Diet == input$diet),x = Time, y=weight)

  })
  
  #calculate de weight mean of the selected diet
  output$weight_mean <- renderText({
    
    mean(ChickWeight[ChickWeight$Diet== input$diet,]$weight)
    
  })
  
  #calculate de average increase in weight per unit of time for the selected diet
  
  output$w_t_mean <- renderText({
    
    w_t <- ChickWeight[ChickWeight$Diet== input$diet,]$weight/ChickWeight[ChickWeight$Diet== input$diet,]$Time
    w_t[is.infinite(w_t)] <- NA  
    
    mean(w_t, na.rm = TRUE)
    
  })

})