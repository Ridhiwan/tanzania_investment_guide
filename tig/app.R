#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(leaflet.minicharts)

ui <- fluidPage(
    titlePanel("Tanzania Investment Guide Data"),
    p("This application shows the current data that is crucial, prior to investing into different lucrativeindustries in Tanzania."),
    
    sidebarLayout(
        
        sidebarPanel(
            selectInput("prods", "Select productions", choices = prodCols, multiple = TRUE),
            selectInput("type", "Chart type", choices = c("bar","pie", "polar-area", "polar-radius")),
            checkboxInput("labels", "Show values")
        ),
        
        mainPanel(
            leafletOutput("map")
        )
        
    )
)

server <- function(input, output, session) {
    # Initialize map
    output$map <- renderLeaflet({
        basemap %>%
            addMinicharts(
                prodRegions$lng, prodRegions$lat,
                layerId = prodRegions$area,
                width = 45, height = 45
            )
    })
    
    # Update charts each time input value changes
    observe({
        if (length(input$prods) == 0) {
            data <- 1
        } else {
            data <- prodRegions[, input$prods]
        }
        maxValue <- max(as.matrix(data))
        
        leafletProxy("map", session) %>%
            updateMinicharts(
                prodRegions$area,
                chartdata = data,
                maxValues = maxValue,
                time = prodRegions$month,
                type = ifelse(length(input$prods) < 2, "polar-area", input$type),
                showLabels = input$labels
            )
    })
}


# Run the application 
shinyApp(ui = ui, server = server)
