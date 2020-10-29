#load data into R with readxl
library("readxl")
setwd("~/analysis")
brooklyn <- read_excel("C:\\Users\\mm_wi\\Documents\\analysis\\rollingsales_brooklyn.xls", skip =4) #ignore the first four rows
#view the data with tidyr::glimpse()
library(tidyverse)
glimpse(brooklyn) # view the column names
#data types
mean(brooklyn$`SALE PRICE`)
#ready to plot
qplot(`SALE DATE`, data=brooklyn) #naje the histogram
#combining datasets
brooklyn <- read_excel("rollingsales_brooklyn.xls", skip =4)
 #ignore the first four rows
bronx <- read_excel("rollingsales_bronx.xls", skip =4)
manhattan <- read_excel("rollingsales_manhattan.xls", skip=4)
staten_island <- read_excel("rollingsales_statenisland.xls", skip=4)
queens<- read_excel("rollingsales_queens.xls", skip = 4)
#Bind all dataframes into one
library(dplyr)
NYC_property_sales <- bind_rows(mutate_all(brooklyn, as.character), mutate_all(bronx, as.character), mutate_all(manhattan, as.character), mutate_all(staten_island, as.character),mutate_all(queens, as.character))## 
glimpse(NYC_property_sales)
#Clean up column names with magrittr magic
library(magrittr)
colnames(NYC_property_sales) %<>% str_replace_all("\\s","_")%<>% tolower()
colnames(NYC_property_sales)