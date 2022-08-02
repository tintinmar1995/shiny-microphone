#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyjs)
library(httr)
library(stringr)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Microphone Example"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            includeHTML("audio-inputs.html"),
            conditionalPanel('false', fileInput('hiddenAudioInput', 'g'))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            includeHTML("audio-outputs.html")
        )
    ),
    
    useShinyjs(),
    tags$script(src="audio-inputs.js")

)

# Define server logic required to draw a histogram
server <- function(input, output) {

    observeEvent(input$audiodata, {
        fname = paste0('audio_', Sys.time(), '.mp3')
        fname = stringr::str_replace_all(fname, ' ', '_')
        fname = stringr::str_replace_all(fname, ':', '-')
        write.csv(input$audiodata, file=fname)
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
