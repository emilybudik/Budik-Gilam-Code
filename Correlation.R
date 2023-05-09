# set working directory

setwd("C:/Users/emily_2vx2daj/OneDrive/Documents/Jinternship Work/R work/Practice/main-practice")


# load packages

library(Hmisc)
library(tidyverse)

# read regression dataset

df_reg <- read_csv("data_regression.csv")
view(df_reg)
str(df_reg)

##Start Work on Correlation

colnames(df_reg)

df_corr <- df_reg %>% select(anagram_score, brick_use_score, brick_creativity, brick_flexibility)

# correlation table 

corr_matrix <- rcorr(as.matrix(df_corr))            
corr_matrix