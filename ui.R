library(shiny)

shinyUI(fluidPage(
  shinyjs::useShinyjs(),
  
  titlePanel("Word Memorizer"),

  # spacer
  fluidRow(
    column(12,
           br(),
           id="sp"),
    align="center"),
    
  # quiz
  fluidRow(
    column(12,
           br(),
           textOutput("hint"),
           textOutput("qestion"),
           textInput("answer", label="", value = ""),
           actionButton("submit", label = "Done"),
           br(), br()
           ),
    align="center"),
  
  # spacer
  fluidRow(
    column(12,
           br(),
           id="sp"),
    align="center"),
  
  # settings
  fluidRow(
    column(3,
           tags$head(tags$script(src="enter.js"),
                     tags$link(rel="stylesheet", type="text/css", href="wm.style.css")),
           fileInput("file", label = h3("File input")),
           id="sidebar"),
    column(9,
           id="sidebar")
  )
))
