library(shiny)

### PUT HERE CODE FOR LOADING dat AND FOR NA-DELETION ###

# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Title"),
  
  # Row with three columns (4 cm width each)
  fluidRow(
    column(4,
           ### selectinput here ###
           ),
    column(4,
           ### textinput here ###
           ),
    column(4, 
           ### radiobuttons here ###
           )
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
)

# Define server logic required to draw a histogram or a bar plot
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    ### PUT HERE CODE FOR BACKEND ###
    
  })
}

# Run the application 
shinyApp(ui = ui, server = server)


