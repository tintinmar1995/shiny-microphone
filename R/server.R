require(shiny)
require(RCurl)


#' @title Render an audio player output
#'
#' @description Returns a renderUI with audio tags
#'
#' @param audio_reactive \code{list}. audioRecordServer returns as reactive.
#'
#' @importFrom shiny renderUI tags
#'
#' @export
renderAudio <- function(audio_reactive){
  return(renderUI({
    if(!is.null(audio_reactive())){
      tags$audio(src=audio_reactive()$url, controls='')
    }
  }))
}


#' @title Write a MP3 file
#'
#' @description Write a MP3 file from the returns of audioRecordServer
#'
#' @param audio \code{list}. evaluated audioRecordServer returns.
#' @param path \code{character}. where to save file
#'
#' @importFrom RCurl base64Decode
#'
#' @export
writeMP3 <- function(audio, path){
  writeBin(RCurl::base64Decode(audio$data, 'raw'), path)
}
