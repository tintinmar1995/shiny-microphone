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


    observe({
        if(!is.null(audio())){
            shinymicrophone::writeMP3(audio, 'audio.mp3')
        }
    })


}

# Run the application
shinyApp(ui = ui, server = server)
