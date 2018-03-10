##########################################
## Title: Shot Charts
## Description: 
## Input(s): andre-iguodala.csv
##           draymond-green.csv
##           kevin-durant.csv
##           klay-thompson.csv
##           stephen-curry.csv
## Output(s):shots-data.csv
##           shots-summary.txt
##           nba-court.jpg
##########################################

# Data Preparation
# setwd("../hw02/code")
rm(list=ls())
library(readr)
library(dplyr)

# read in the five data sets
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

iguodala <- mutate(iguodala, name = rep("Andre Iguodala", n = length(iguodala)))
green <- mutate(green, name = rep("Graymond Green", n = length(green)))
durant <- mutate(durant, name = rep("Kevin Durant", n = length(durant)))
thompson <- mutate(thompson, name = rep("Klay Thompson", n = length(thompson)))
curry <- mutate(curry, name = rep("Stephen Curry", n = length(curry)))



# change values of shot_made_flag to more descriptive ones
players <- function(x){
  x$shot_made_flag[x$shot_made_flag == "n"] = "missed shot"
  x$shot_made_flag[x$shot_made_flag == "y"] = "made shot"
  return(x)
}


iguodala <- players(iguodala)
green <- players(green)
durant <- players(durant)
thompson <- players(thompson)
curry <- players(curry)

makeshot <- function(x){
  x <- mutate(x, minute = 12*period - minutes_remaining)
  x$minute[x$shot_made_flag == "missed shot"] = NA
  return(x)
}

iguodala <- makeshot(iguodala)
green <- makeshot(green)
durant <- makeshot(durant)
thompson <- makeshot(thompson)
curry <- makeshot(curry)

sink(file="../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()
sink(file="../output/graymond-green-summary.txt")
summary(green)
sink()
sink(file="../output/kevin-durant-summary.txt")
summary(durant)
sink()
sink(file="../output/klay-thompson-summary.txt")
summary(thompson)
sink()
sink(file="../output/stephen-curry-summary.txt")
summary(curry)
sink()

dat <- rbind(iguodala,green,durant,thompson,curry)
write.csv(dat,file="../data/shots-data.csv")

sink(file="../output/shots-data-summary.txt")
summary(dat)
sink()

