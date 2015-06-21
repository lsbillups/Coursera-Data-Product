library(shiny)
library(datasets)
data(mtcars)

fit<-lm(mpg ~ wt+qsec+am, data = mtcars)

shinyServer(
    function(input,output){
        output$inputValue1<-renderPrint({input$Wt1})
        output$inputValue2<-renderPrint({input$qsec1})
        output$InputValue3<-renderPrint(input$am1)
        output$prediction<-renderPrint(
            {predict(fit,data.frame(wt = (input$Wt1),qsec = (input$qsec1),
                                    am = ifelse(input$am1=="Automatic",0,1)),interval = "prediction")}
        )
    }
)