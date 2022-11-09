#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(tidyverse)
library(dplyr)
library(medicaldata)

smartpill$Group <- as.character(smartpill$Group)
smartpill$Group[smartpill$Group == "0"] <- 'Ill Patients'
smartpill$Group[smartpill$Group == "1"] <- 'Healthy Volunteers'

names(scurvy)[4] <-  "Gum Rot"
names(scurvy)[5] <- "Skin Sores"
names(scurvy)[6] <- "Weakness of the Knees"
names(scurvy)[7] <- "Lassitude"
names(scurvy)[8] <- "Fit for Duty"

scurvy$treatment <- as.character(scurvy$treatment)
scurvy$treatment[scurvy$treatment == "cider"] <- 'Cider'
scurvy$treatment[scurvy$treatment == "dilute_sulfuric_acid"] <- 'Dilute Sulfuric Acid'
scurvy$treatment[scurvy$treatment == "vinegar"] <- 'Vinegar'
scurvy$treatment[scurvy$treatment == "sea_water"] <- 'Sea Water'
scurvy$treatment[scurvy$treatment == "citrus"] <- 'Citrus'
scurvy$treatment[scurvy$treatment == "purgative_mixture"] <- 'Purgative Mixture'

names(smartpill)[7] <- "Time from Ingestion to Gastric Emptying"
names(smartpill)[8] <- "Time from Gastric Emptying to Ileocecal Junction"
names(smartpill)[10] <- "Time from Ingestion to Body Exit"


shinyServer(function(input, output) {
  
  output$plot1 <- renderPlotly({
    
    ggplot_plot <- scurvy %>% 
      filter(treatment %in% input$trt_var) %>% 
      ggplot(aes(get(input$sick_var), fill = treatment)) +
      geom_bar(position = position_dodge()) +
      labs(y = 'Count',
           x = "Sickness's Severity",
           title = "Bar Chart of Sickness's Severity between Patients in Different Treatments") +
      scale_fill_discrete(name = "Treatment")
    
    ggplotly(ggplot_plot)
    
  }) 
  
  output$plot2 <- renderPlotly({
    
    smartpill$Group <- as.character(smartpill$Group)
    levels(smartpill$Group) <- c("Patient","Volunteer")
    ggplot_plot2 <- smartpill %>% 
      ggplot(aes(Group, get(input$box_var), fill = Group)) +
      geom_boxplot() +
      labs(y = 'Evaluation Variable',
           title = 'Boxplot of Evaluation Variables between Healthy Volunteers and Ill Patients')
    
    ggplotly(ggplot_plot2)
    
  }) 
  
  output$plot3 <- renderPlotly({
    
    smartpill$Group <- as.character(smartpill$Group)
    levels(smartpill$Group) <- c("Patient","Volunteer")
    ggplot_plot3 <- smartpill %>% 
      ggplot(aes(get(input$hist_var), fill=Group)) +
      geom_histogram(position = "dodge") +
      labs(y = 'Count',
           x = "Evaluation Variable's Value",
           title = 'Histogram of Evaluation Variables between Healthy Volunteers and Ill Patients')
    
    ggplotly(ggplot_plot3)
    
  }) 
})
           
  
  
