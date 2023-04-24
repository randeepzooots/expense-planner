#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {
  
  df <- reactiveValues()
  df$dt <- data.frame()
  
  newRow <- observeEvent(input$addrow,{
    newLine <- c(input$name,input$months,input$amount)
    df$dt <- rbind(df$dt, newLine)
  })
  
  newRow <- observeEvent(input$revrow,{
    newLine <- df$dt[-nrow(df$dt),]
  })
  
  
  save <- observe({
    if (input$save == 1)
    {
      write.csv(df$dt,'df.csv')
      showNotification('CSV Saved')
    }
  })
  
  
  # output$text1 <- h1('Expenses')
  output$table <- renderTable({df$dt})

}
