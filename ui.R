library(shiny)
source("library.R")

shinyUI(fluidPage(
  
  # include additional files
  includeScript("www/speechSynthesis.js"),
  includeScript("www/enter.js"),
  includeCSS("www/wm.style.css"),
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
           h4("DICTIONARY"),
           fileInput("file", label=NULL, placeholder=f)), #h3("File input")
    column(3,
           h4("SPEACH"),
           checkboxInput("speak", label="speak", value=TRUE),
           selectInput("lang", label=NULL, choices=c("de-DE","en-US","en-GB","es-ES","fr-FR","it-IT","ja-JP","ko-KR","pl-PL","zh-CN"), selected="de-DE", width="50%")),
    column(6),
  id="sidebar")
))


