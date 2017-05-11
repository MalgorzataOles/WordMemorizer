library(shiny)
source("library.R")

options(stringsAsFactors=FALSE)

shinyServer(function(input, output, session) {

  # load the dictionary
  dict = reactive({
    file = if(is.null(input$file)) f else input$file$datapath
    read.csv(req(file), header=TRUE, encoding="utf-8")
  })
  
  rv = reactiveValues(reset=0)
  finito = FALSE
  n = reactive(nrow(dict()))
  
  # quiz set-up
  observe({
    rv$reset
    rv$checklist = seq_len(n())
    rv$i = 1
    rv$hint = ""
    rv$fin = FALSE
    updateActionButton(session, inputId="submit", label="Done")
  })
  
  output$qestion = renderText(rv$question)
  output$hint = renderText(rv$hint)
  
  # button action
  observeEvent(input$submit, {
    
    if(rv$fin) { # reset quiz when finish reached
      rv$reset = rv$reset + 1
    } else { # go ahead with quiz
      i = rv$i
      correctAnswer = dict()[rv$checklist[i], 2]
      if(input$answer==correctAnswer) { # correct answer
        if(rv$hint=="") # hint was not needed
          rv$checklist[i] = NA  # remove word from queue
        else
          rv$hint = "" # reset hint
        i = i + 1 # go to another word
        while(is.na(rv$checklist[i])) { # skip solved questions
          if(i > n()) { # arrived at the end
            if(all(is.na(rv$checklist))) { # hurra! quiz solved!
              finito = TRUE
              rv$fin = TRUE
              break
            } else { # restart list if still unanswered questions
              i = 1
            }
          } else {  # look at next question
            i = i + 1
          }
        }
      } else { # incorrect answer, print hint
        rv$hint = correctAnswer
      }
      if(finito) { # actions when quiz solved
        rv$question = ""
        rv$hint = ""
        updateActionButton(session, inputId="submit", label="Again please!")
      } else {
        rv$i = i
      }
      updateTextInput(session, "answer", value="") # reset user input
      session$sendCustomMessage(type='speakme', correctAnswer)
  }})
  
  # activate or deactivate text field
  observe({shinyjs::toggleState("answer", !rv$fin)})
  
  # set question
  observe({
    quest = dict()[rv$checklist[rv$i],1]
    rv$question = ifelse(is.na(quest), "Well done!", quest)
  })
  
  # dieable/anable language type depending on speak
  observe({
    shinyjs::toggleState("lang", input$speak==TRUE)
  })

})
