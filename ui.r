shinyUI(fluidPage(
  titlePanel(h1("GAM with Controls")),
  sidebarLayout(
    sidebarPanel(
     checkboxGroupInput("varInput", 
        label = h3("Include Variables"), 
        choices = list("Civil War" = 1, 
           "Interstate War" = 2, "GDP/capita" = 3, 
           "Log(population)" = 4, "Civilization" = 5, 
           "Veto" = 6),
        selected = c(1,2,3,4,5,6)),
     numericInput("k", label = h3("Basis Dimension"), 
        value=5)
       ) ,
    mainPanel(plotOutput("gam", width="100%"))
)

))               
