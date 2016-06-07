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

#soundex
s_name <- soundex(name, maxCodeLen = 14L)
s_sdn_names <- soundex(sdn_names$name, maxCodeLen = 14L)

#metaphone
m_name <- metaphone(name,maxCodeLen = 14L)
m_sdn_names <- metaphone(sdn_names$name, maxCodeLen =14L)

#string_distances
#direct
dist <- stringdist(name,sdn_names$name)
min(dist) 
max(dist)

#soundex

s_dist <- stringdist(s_name,s_sdn_names)
min(s_dist) 
max(s_dist)


#metaphone

m_dist <- stringdist(m_name,m_sdn_names)
min(m_dist)
max(m_dist)



all <- data.frame(name=sdn_names,soundex=s_sdn_names,metaphone=m_sdn_names)
