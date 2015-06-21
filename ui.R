library(shiny)


shinyUI(pageWithSidebar(
    headerPanel ("Miles-Per-Gallon (MPG) Prediction"),
    
    sidebarPanel(
        numericInput('Wt1','Weight /1000lbs', 3.5, min = 1.5, max = 5.5, step = 0.05),
        numericInput('qsec1','Quarter mile time /sec', 18, min = 14, max = 23, step = 0.1),
        selectInput('am1','Transmission',c("Automatic","Manual")),
        submitButton('Submit'),
        strong('VARIABLE DESCRIPTIONS:'),
        
        tags$ul(
            tags$li('Weight - the weight of the car,measured in unit of thousand pounds'),
            tags$li('Quarter mile time - Acceleration time for the first quarter mile, measured in unit of seconds'),
            tags$li('Transmission - The type of transmission for the car,either manual or automatic')
        ),  
        strong('SPECIAL NOTES:'),
        p('The prediction model is built based on the `mtcars` dataset
        in the `datasets` package. The multivariate regression model
        uses weight, quarter mile time and type of transmission as
        the predictor.'),
        strong('INSTRUCTION:'),
        p('Simply type in the weight of your car (range from 1.5 to 5.5),
        the quarter mile time the car takes (range from 14 to 23),
        select the type of transmission and hit "Submit",the app will
        atuomatically give you the predicted MPG and the corresponding
        95% prediction interval based on the model.')
        
    ),
    mainPanel (
        h3('Results of prediction'),
        h4('Weight'),
        verbatimTextOutput("inputValue1"),
        h4('Quater mile time'),
        verbatimTextOutput("inputValue2"),
        h4('Transmission'),
        verbatimTextOutput("InputValue3"),
        h4('Predicted MPG with 95% prediction interval'),
        verbatimTextOutput("prediction")
    )
)
    
)