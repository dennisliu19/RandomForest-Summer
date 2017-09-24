library(shiny)
library(shinydashboard)
library(randomForest)
library(gbm)
# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
  output$forestIntro <- renderText({
    if (input$IntroductionForest){
      paste("In the random forest approach, a large number of decision trees are created. Every observation is fed into every decision tree. The most common outcome for each observation is used as the final output. A new observation is fed into all the trees and taking a majority vote for each classification model.")
    }
  })
  
  output$forestSummary <- renderText({
    if (input$SummaryForest) {
      rf.iris = randomForest(Species~., data=iris)
      paste("Iris Data: \n Number of trees: ", rf.iris$ntree, "\n", "Number of variables tried at each split: ", rf.iris$mtry, "\n", "Out-of-bag estimate of error rate: 4%")
    }
  })
  
  output$confusionTable <- renderTable({
    if (input$TableForest) {
      rf.iris$confusion
    }
  })
  
  output$boostingIntro <- renderText({
    if (input$IntroductionBoosting){
      print("The algorithm for Boosting Trees evolved from the application of boosting methods to regression trees. The general idea is to compute a sequence of (very) simple trees, where each successive tree is built for the prediction residuals of the preceding tree. This method will build binary trees, i.e., partition the data into two samples at each split node. Now suppose that you were to limit the complexities of the trees to 3 nodes only: a root node and two child nodes, i.e., a single split. Thus, at each step of the boosting (boosting trees algorithm), a simple (best) partitioning of the data is determined, and the deviations of the observed values from the respective means (residuals for each partition) are computed. The next 3-node tree will then be fitted to those residuals, to find another partition that will further reduce the residual (error) variance for the data, given the preceding sequence of trees.")
    }
  })
  
  output$boostingPlot <-renderPlot({
    if (input$SummaryBoosting) {
      boost.iris = gbm(Species~., data=iris, distribution = "gaussian", n.tree = 10000, shrinkage = 0.01, interaction.depth = 4)
      summary(boost.iris)
    }
  })
  
  
  
})