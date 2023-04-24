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
fluidPage(

    # Application title
    titlePanel("Expense-Planner"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          HTML("<h3>Add Expense Details</h3>"),
            textInput('name', 'Expense Name',value = 'Expense'),
            selectInput('months', 'Expense Months',
                        c('Select month(s)'='',
                          'January'=1,
                          'February'=2,
                          'March'=3,
                          'April'=4,
                          'May'=5,
                          'June'=6,
                          'July'=7,
                          'August'=8,
                          'September'=9,
                          'October'=10,
                          'Novemer'=11,
                          'December'=12),
                        multiple = T, selectize = T),
            numericInput('amount','Amount', value = 1,min = 1),
            actionButton("addrow", "Add Expense"),
            actionButton("revrow", "Remove Expense"),
            actionButton('save','Save')
        ),

        # Show a plot of the generated distribution
        mainPanel(
            # verbatimTextOutput('text1'),
            tableOutput('table')
        )
    )
)
