library(shiny)
library(shinyjs)
library(httr)
library(stringr)
library(shinymicrophone)

ui <- fluidPage(

    titlePanel("Microphone Example"),

    sidebarLayout(
        sidebarPanel(
            shinymicrophone::audioRecordButtons('main')
        ),

        mainPanel(
            uiOutput("myAudio")
        )
    )

)

# Define server logic required to draw a histogram
server <- function(input, output) {

    audio <- shinymicrophone::audioRecordServer('main')

    output$myAudio <- shinymicrophone::renderAudio(audio)

}

# Run the application
shinyApp(ui = ui, server = server)
