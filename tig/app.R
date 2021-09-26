library(shiny)
library(tidyverse)
library(leaflet)
library(leaflet.minicharts)
load("tzeco2mixx")

tilesURL <- "http://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"
basemap <- leaflet(width = "100%", height = "400px") %>%
  addTiles(tilesURL)

prodRegions <- tzeco2mixx %>% filter(area != "Tanzania")
prodCols <- names(prodRegions)[6:13]

ui <- fluidPage(
    titlePanel("Tanzania Investment Guide Data"),
    p("This application shows the current data that is crucial, 
      prior to investing into different lucrative industries in Tanzania."),
    
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
