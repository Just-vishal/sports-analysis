# Install required packages
install.packages("shiny")
install.packages("plotly")

# Load the required libraries
library(shiny)
library(plotly)

# Define the user interface
ui <- fluidPage(
  titlePanel("Sports Analysis Web App"),
  sidebarLayout(
    sidebarPanel(
      selectInput("sport", "Select Sport:",
                  choices = c("Football", "Basketball", "Soccer")),
      sliderInput("year", "Select Year:",
                  min = 2010, max = 2022, value = 2020)
    ),
    mainPanel(
      plotlyOutput("sportsPlot")
    )
  )
)

server <- function(input, output) {
  
  output$sportsPlot <- renderPlotly({
    
    data <- data.frame(
      Year = seq(2010, 2022),
      Performance = rnorm(13, mean = 100, sd = 10)
    )
    
    filtered_data <- subset(data, Year <= input$year)
    
    plot <- ggplot(filtered_data, aes(x = Year, y = Performance)) +
      geom_line() +
      labs(title = paste("Performance Analysis for", input$sport),
           x = "Year", y = "Performance")
    
    # Convert the ggplot to a plotly object
    ggplotly(plot)
  })
  
}

# Run the Shiny app
shinyApp(ui, server)
