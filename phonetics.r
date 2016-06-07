#install.packages("stringdist")
#install.packages("XML")
#install.packages("phonTools")
#install.packages("phonics")
library(stringdist)
library(XML)
library(phonTools)
library(phonics)

phonetic(c("sam","ram","suresh","ganesh"))

url <- "E:/R/AML/Data/SDN.XML"
sdn <- xmlToDataFrame(url)
names(sdn)
input <- read.csv(file="E:/R/AML/Data/input1.csv", header = TRUE)
names(input)



name <- paste(input$FIRST_NAME[1],input$LAST_NAME[1])

sdn_names <- data.frame(name=paste(sdn$firstName,sdn$lastName))




phonetic(name,sdn_names)