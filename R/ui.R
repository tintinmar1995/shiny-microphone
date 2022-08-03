require(shiny)

audioRecordButtons <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    useShinyjs(),

    # Add Shiny Buttons
    actionButton(ns("record"), label = label),
    actionButton(ns("stop"), label = label),
    includeHTML("audio-inputs.html"),

    # Create JS objects from Shiny-UI
    tags$script(paste0(
      "const startAudioButton = document.querySelector('#",
      ns("record"), "');")),
    tags$script(paste0(
      "const stopButton = document.querySelector('#",
      ns("stop"), "');")),

    # Add script linked to shiny button
    includeHTML("audio-script.html")
  )
}
