library(shiny) 
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Body Mass Index (BMI) Calculator"),
    
    sidebarPanel(
      selectInput(inputId = "Gender",
                  label = "Select your Gender",
                  choices = c("Male","Female"),
                  selected = "Female"),
      numericInput('Weight', 'Insert your weight in Pounds', 100) ,
      numericInput('Height', 'Insert your height in Foot', 5.6, 
                   min = 4, max = 7, step = 0.1),
      submitButton('Submit')
    ), 
    mainPanel(
      h1("Body Mass Index (BMI)"),
      p('It is also known as Quetelet Index. The BMI is an attempt to quantify the amount of tissue mass (muscle, fat, and bone) in an individual, and then categorize that person as low, normal, obese level 1, obese level 2, obese level 3 or obese level 4 based on that value.'),
      p('The Hospital Authority of Hong Kong recommends the use of the following BMI ranges'),
      tags$div(
        tags$ul(
          tags$li('BMI <18.5       : Low'),
          tags$li('BMI [18.5-24.9] : Normal'),
          tags$li('BMI [25-29.9]   : Obese Level 1'),
          tags$li('BMI [30-34.9]   : Obese Level 2'),
          tags$li('BMI [35-39.9]   : Obese Level 3'),
          tags$li('BMI >=40        : Obese Level 4')
        )
      ),
      
      h2('BMI:'),verbatimTextOutput("Estimation"),
      p('Categorization:'),strong(verbatimTextOutput("Category"))
    )
    
  )   
)