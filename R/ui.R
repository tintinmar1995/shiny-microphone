require(shiny)

audioRecordButtons <- function(id, label_start = "Record", label_stop = "Stop") {
  ns <- NS(id)
  tagList(
    useShinyjs(),

    # Add Shiny Buttons
    actionButton(ns("record"), label = label_start),
    actionButton(ns("stop"), label = label_stop),

    # Create JS objects from Shiny-UI
    tags$script(paste0(
      "const startAudioButton = document.querySelector('#",
      ns("record"), "');")),
    tags$script(paste0(
      "const stopButton = document.querySelector('#",
      ns("stop"), "');")),

    # Add script linked to shiny button
    includeHTML(paste0(
      system.file(file.path("templates"), package = "shinymicrophone"),
      '/audio-script.html'
    )),

  )
}
