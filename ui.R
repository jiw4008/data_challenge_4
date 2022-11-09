#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(plotly)
trt_names <- c("Cider", "Dilute Sulfuric Acid", "Vinegar", "Sea Water", "Citrus", "Purgative Mixture")


navbarPage("Data Challenge 4", 
           
  tabPanel("Plot 1: Histogram for Blood Storage",
    sidebarPanel(
      h4("Scurvy Data", style = "font-weight: bold"),
      p("This data set contains 12 participants with scurvy. 
        6 distinct therapies were tested in 12 seamen with symptomatic scurvy. 
        Endpoints were reported in the text at the end of 6 days. 
        These include rotting of the gums, skin sores, weakness of the knees, 
        and lassitude, which are described in terms of severity."),
      
      h4("Instructions", style = "font-weight: bold"),
      p("For the certain kind of sickness you want to explore, 
         please click the corresponding radio buttons. For the outcomes showed 
         in different treatment groups, please check them in the check boxes.
         Be aware: the radio box can only be chosen one at one time,
         however the check box can be placed at most 6 at one time."),
      
      radioButtons("sick_var", "Check the certain kind of outcome",
                  c("Gum Rot", "Skin Sores", "Weakness of the Knees", "Lassitude", "Fit for Duty")),
      checkboxGroupInput(inputId = "trt_var", label = "Treatment names to display",
                        sort(trt_names),
                        selected = c("Cider", "Dilute Sulfuric Acid", "Vinegar", "Sea Water", "Citrus", "Purgative Mixture"))
    ),
      
    mainPanel(
      plotlyOutput("plot1")
    )
    
  ),
           
  tabPanel("Plot 2: Boxplot for Smart Pill",
    sidebarLayout(
      
      sidebarPanel(
        
        h4("Smart Pill Data", style = "font-weight: bold"),
        p("Data were obtained with a motility capsule that wirelessly transmitted pH, 
           pressure, and temperature to a recorder attached to 8 critically ill trauma patients
           and 87 healthy volunteers from a separate trial. Transit times were available 
           for almost all patients, however, pH, pressure and temperature data is missing 
           for all critically ill patients and sparsely missing for the healthy volunteers."),
        
        h4("Instructions", style = "font-weight: bold"),
        p("For the different evaluation variables in gastric emptying, small bowel transit time, 
           and total intestinal transit times between the 8 critically ill trauma patients
           and 87 healthy volunteers, please click the corresponding circle"),
        
        radioButtons("box_var", "Check the certain kind of variable",
                    c("Height", "Weight", "Age", 
                      "Time from Ingestion to Gastric Emptying", 
                      "Time from Gastric Emptying to Ileocecal Junction", 
                      "Time from Ingestion to Body Exit")),
      ),
      
      mainPanel(
        plotlyOutput("plot2")
      ) 
      
    )
  ),
           
  tabPanel("Plot 3: Histogram for Smart Pill",
    sidebarLayout(
      sidebarPanel(
        
        h4("Smart Pill Data", style = "font-weight: bold"),
        p("Data were obtained with a motility capsule that wirelessly transmitted pH, 
           pressure, and temperature to a recorder attached to 8 critically ill trauma patients
           and 87 healthy volunteers from a separate trial. Transit times were available 
           for almost all patients, however, pH, pressure and temperature data is missing 
           for all critically ill patients and sparsely missing for the healthy volunteers."),
        
        h4("Instructions", style = "font-weight: bold"),
        p("For the different evaluation variables in gastric emptying, small bowel transit time, 
           and total intestinal transit times between the 8 critically ill trauma patients
           and 87 healthy volunteers, please check the corresponding check boxes"),
        
        radioButtons("hist_var", "Check the certain kind of variable",
                      c("Height", "Weight", "Age", 
                        "Time from Ingestion to Gastric Emptying", 
                        "Time from Gastric Emptying to Ileocecal Junction", 
                        "Time from Ingestion to Body Exit")),
      ),
      mainPanel(
        plotlyOutput("plot3")
      ) 
    )
  )
)