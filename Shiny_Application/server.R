library(shiny) 

BMI<-function(weight,height) 
  {
  weight<-weight * 0.453592
  height<-height * 0.3048
  weight/(height^2)
  }

category_function<-function(weight,height)
  {
  weight<-weight * 0.453592
  height<-height * 0.3048
  BMI_value<-weight/(height^2)
  ifelse(BMI_value<18.5,"Low",
         ifelse(BMI_value<25,"Normal",
                ifelse(BMI_value<30,"Obese Level 1",
                       ifelse(BMI_value<35,"Obese Level 2",
                              ifelse(BMI_value<40,"Obese Level 3","Obese Level 4"
                       )))))
  }

shinyServer(
  function(input, output) 
    {
    output$Gender_Value <- renderPrint({input$Gender})
    output$Weight_Value <- renderPrint({input$Weight})
    output$Height_Value <- renderPrint({input$Height})
    output$Estimation <- renderPrint({BMI(input$Weight,input$Height)})
    output$Category <- renderPrint({category_function(input$Weight,input$Height)})
  } 
)