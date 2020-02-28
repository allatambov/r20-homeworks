library(shiny)

dat <- read.csv("/Users/allat/Desktop/chile.csv") 
dat <- na.omit(dat)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Visualization for Chile 1988 data set"),
  
  # Sidebar with: dropdown menu for column, 
  # text input for color 
  # and radio buttons for region
  fluidRow(
    column(4,
      selectInput("index", "Column to visualise:", 
                  choices = setNames(1:ncol(dat), colnames(dat)))),
      column(4,
             textInput("color", "Choose color:", placeholder = "e.g. red or #3131d4")),
      column(4, radioButtons("reg", "Region:", 
                             c("All", as.character(unique(dat$region)))))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    if (input$reg != "All") {
      dat <- dat[dat$region == input$reg,]}
    
    x <- dat[,as.numeric(input$index)]
    
    if (input$color == ""){gcolor <- "grey"}else{
      gcolor <- input$color
    }
    
    if (class(x) == "numeric" | class(x) == "integer"){
      hist(x, border = 'white', col = gcolor)}else{
        barplot(table(x), col = gcolor)
      }
  })
}

# Run the application 
shinyApp(ui = ui, server = server)