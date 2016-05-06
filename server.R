library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  require(mgcv) 
  load("data.rda")
  output$gam <- renderPlot({
      varnames <- c("cwar", "iwar", "gdppc", "logpop", "civ", "veto") 
      if(length(input$varInput) > 0){
          form <- as.formula(paste("rep1 ~ 1+ s(voice, k=", input$k, ") + ", paste(varnames[as.numeric(input$varInput)], collapse="+"), sep=""))
      }
      else{
          form <- as.formula(paste("rep1 ~ 1+ s(voice, k=", input$k, ")", sep=""))
      }
      mod <- gam(form, data=dat)
      plot.gam(mod)

  }, width=500, height=500)
})