
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Chicken Weights in Time"),
  
  sidebarPanel(
    
    selectInput("diet", "Diet", diet_list, multiple = FALSE)
      
    ),
  
  mainPanel(
    
    h3("Weight by Time for the selected Diet"),
    plotOutput("weight_time_plot"),
    
    h3("Average Weight for this Diet"),
    verbatimTextOutput("weight_mean"),
    
    h3("Average Weight increment per unit of time for this diet"),
    verbatimTextOutput("w_t_mean")
    
  )
))
