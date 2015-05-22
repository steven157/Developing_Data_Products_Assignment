library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
  YX <- reactive({
    paste("as.integer(", input$y,")", "~", "as.integer(", input$x,")")
  })
  
  Frml <- reactive({
    lm(as.formula(YX()),data = mtcars)
  })
  
  output$summary <- renderPrint({
    predicting <- input$x
    responding <- input$y
    ftr <- names(mtcars)
    for (i in 1:length(ftr)) {
      if(predicting == ftr[i]){
        pre <- summary(eval(parse(text = paste("mtcars$",ftr[i],sep = ""))))
      }
      if(responding == ftr[i]){
        res <- summary(eval(parse(text = paste("mtcars$",ftr[i],sep = ""))))
      }
    }
    list(assign(predicting, pre), assign(responding, res))
  })
  
  
  output$text <- renderText({
    paste("Regression Model:", input$y, "~", input$x)
  })
  
  output$Plot <- renderPlot ({
    with(mtcars, {plot(as.formula(YX()),xlab=input$x,ylab=input$y)
                abline(Frml(), col=input$color)
    })
  })
})