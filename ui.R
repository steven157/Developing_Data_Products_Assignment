library(shiny)
library(datasets)
require(graphics)
shinyUI(fluidPage(
  headerPanel(img(src = "CourseraLogo.png")),
  
  # description and input
  sidebarPanel(
    h3('Input Area'),
    p('Play around with the mtcars dataset.'),
    p('Select the predicting variable:'),
    selectInput('x', label='Predictor', selected='cyl', choices=names(mtcars)),
    p('Select the responding variable:'),
    selectInput('y', label='Outcome', selected='mpg', choices=names(mtcars)),
    p('Choose the line color.'),
    selectInput('color', label='Color', choices=palette()),
    h3('Documentation'),
    p("The 'mtcars' dataset was used to plot the",
      "regression model using two variables from this dataset:",
      "one as predicting, one as responding variable."),
    p("When both predicting and responding variables are selected",
      "the plot is updated with the new fit.")),
  
  # plot and output
  mainPanel(
    div(h1("Developing Data Products Assignment", style="color:#0033ff;margin:-60px 0px 10px 20px;")),
    h4('Summary of Selected Factors'),
    h4(verbatimTextOutput("summary")),
    h4(textOutput('text')),
    plotOutput('Plot'))
  
))