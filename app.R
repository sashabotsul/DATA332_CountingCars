library(shiny)
library(ggplot2)
library(DT)
library(readxl)

data_url <- getURL("https://raw.githubusercontent.com/retflipper/DATA332_CountingCars/refs/heads/main/data/Counting_Cars.csv")
dataset <- read.csv(text = data_url)

dataset <- dataset[-1]
dataset <- dataset[1:9]

car_types <- c(
  "1" = "Emergency",
  "2" = "Hatchback",
  "3" = "Sedan",
  "4" = "SUV",
  "5" = "Van",
  "6" = "Minivan",
  "7" = "Motorcycle",
  "8" = "Coupe",
  "9" = "Truck",
  "10" = "Pickup Truck"
)

dataset$Type_of_Car <- car_types[as.character(dataset$Type_of_Car)]

column_names<-colnames(dataset) #for input selections


ui<-fluidPage( 
  
  titlePanel(title = "Explore MTCARS Dataset"),
  h4('Motor Trend Car Road Tests'),
  
  fluidRow(
    column(2,
           selectInput('X', 'Choose X',column_names,column_names[1]),
           selectInput('Y', 'Choose Y',column_names,column_names[3]),
           selectInput('Splitby', 'Split By', column_names,column_names[3])
    ),
    column(4,plotOutput('plot_01')),
    column(6,DT::dataTableOutput("table_01", width = "100%"))
  )
  
  
)

server<-function(input,output){
  
  output$plot_01 <- renderPlot({
    ggplot(dataset, aes_string(x=input$X, y=input$Y, colour=input$Splitby))+ geom_point()
  })
  
  output$table_01<-DT::renderDataTable(dataset[,c(input$X,input$Y,input$Splitby)],options = list(pageLength = 4))
}

shinyApp(ui=ui, server=server)
