require(shiny)
require(RCurl)

audioRecordServer <- function(id){

  moduleServer(
    id,
    function(input, output, session){

      out <- reactive({

        input$data
        isolate({
          if (is.null(input$data)){
            return(NULL)
          } else {
            return(list(
              url=input$url,
              data=input$data
            ))
          }
        })

      })

      return(out)
    }
  )
}


renderAudio <- function(audio_reactive){
  return(renderUI({
    if(!is.null(audio_reactive())){
      tags$audio(src=audio_reactive()$url, controls='')
    }
  }))
}


writeMP3 <- function(audio_reactive, path){
  bin = RCurl::base64Decode(stringr::str_replace(
    audio_reactive()$data, 'data:audio/mp3;base64,', ''), 'raw')
  writeBin(bin, path)
}

