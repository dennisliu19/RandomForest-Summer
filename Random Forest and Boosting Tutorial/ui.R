#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

convertMenuItem <- function(out,tabName) {
  out$children[[1]]$attribs['data-toggle']="tab"
  out$children[[1]]$attribs['data-value'] = tabName
  out
}

dashboardPage(
  dashboardHeader(title = "Random Forest and Boosting",
                  titleWidth = 300),
  dashboardSidebar(
    sidebarMenu(
      convertMenuItem(menuItem("Random Forest",tabName = "forest",icon=icon("dashboard"),
                               checkboxInput("IntroductionForest", "Introduction"),
                               checkboxInput("SummaryForest", "Summary"),
                               checkboxInput("TableForest", "Confusion Table")
      ),tabName="forest"),
      convertMenuItem(menuItem("Boosting",tabName = "boosting",icon=icon("dashboard"),
                               checkboxInput("IntroductionBoosting", "Introduction"),
                               checkboxInput("SummaryBoosting", "Summary")
      ),tabName="boosting")
    ), width = 300
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "forest",
              column(width=12,
                     box(width=NULL,
                         status="primary",
                         title="Introduction",
                         olidHeader = TRUE,
                         collapsible = TRUE,
                         verbatimTextOutput("forestIntro"),
                         height = 200),
                     box(width=NULL,
                         status="primary",
                         title="Summary",
                         olidHeader = TRUE,
                         collapsible = TRUE,
                         verbatimTextOutput("forestSummary"),
                         height = 200),
                     box(width=NULL,
                         status="primary",
                         title="Confusion Table",
                         olidHeader = TRUE,
                         collapsible = TRUE,
                         tableOutput("confusionTable"),
                         height = 200)
              )),
      tabItem(tabName = "boosting",
              column(width=12,
                     box(width=NULL,
                         status="primary",
                         title="Introduction",
                         olidHeader = TRUE,
                         collapsible = TRUE,
                         verbatimTextOutput("boostingIntro"),
                         height = 350),
                     column(width=12,
                            box(width=NULL,
                                status="primary",
                                title="Summary",
                                olidHeader = TRUE,
                                collapsible = TRUE,
                                plotOutput("boostingPlot"),
                                height = 350)
                            
                     )
              )
      )
    )
    
  )   
) 