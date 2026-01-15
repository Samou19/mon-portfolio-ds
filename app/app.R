library(shiny)
library(plotly)

ui <- fluidPage(
  titlePanel("Test ShinyLive"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        "n",
        "Nombre de points",
        min = 10,
        max = 200,
        value = 50
      )
    ),
    
    mainPanel(
      plotlyOutput("plot")
    )
  )
)

server <- function(input, output, session) {
  
  output$plot <- renderPlotly({
    set.seed(1)
    
    x <- rnorm(input$n)
    y <- cumsum(x)
    
    plot_ly(
      x = seq_along(y),
      y = y,
      type = "scatter",
      mode = "lines"
    )
  })
}

shinyApp(ui, server)

# shinylive::export(
#   appdir = "app",
#   destdir = "docs"
# )



