library(shiny)
library(RSQLite)
source('predict.R')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  # input$text and input$action are available
  # output$sentence and output$predicted should be made available
  db <- dbConnect(SQLite(), dbname="train.db")
  dbout <- reactive({ngram_backoff(input$text, db)})
  
  output$sentence <- renderText({input$text})
  output$predicted <- renderText({
    out <- dbout()
    if (out[[1]] == "Sorry! You've stumped me, I don't know what would come next.") {
      return(out)
    } else {
      return(unlist(out)[1])
    }})
  output$alts <- renderTable({dbout()})
})