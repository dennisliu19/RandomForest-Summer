library(shiny)
library(ggplot2)
library(plyr)
library(tree)

data <- iris

var <- c("Sepal Length" = "Sepal.Length",
         "Sepal Width" = "Sepal.Width",
         "Petal Length"= "Petal.Length",
         "Petal Width"= "Petal.Width")


dataset <-c("Iris1" = "iris1",
            "Iris2" = "iris2",
            "Turtles" = "turtles")

turtles <- read.table(file = "http://www.public.iastate.edu/~maitra/stat501/datasets/turtles.dat", 
                      col.names = c("gender", "carapace length",  "carapace width", "carapace height"))

turtles$sex <- ifelse(turtles$gender==1,"Female", "Male")