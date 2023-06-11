#cronb's alph
setwd("C:/Users/emily_2vx2daj/OneDrive/Documents/Jinternship Work/R work/Practice/main-practice")

library(tidyverse)
library(DescTools)
library(psych)
library(readxl)

#----------------------------------------------------------------------------

data_4_cron <- read_csv("cronbach alphs/data 4 cron.csv")
total_score <- read_excel("data.xlsx", range = "AJ1:AJ151")

(total_score)
(data_4_cron)


alpha(data_4_cron)
CronbachAlpha(data_4_cron)

#mean/med/sd
total_v <- as.vector(total_score, mode = "any")
median(unlist(total_v))
mean(unlist(total_v))
sd(unlist(total_v))

## for exluded particips
cronb_exempt <- read_excel("cronb_exempt.xlsx")
cronb_ex_total <- read_excel("cronb ex total.xlsx")


#alpha
CronbachAlpha(cronb_exempt)
alpha(cronb_exempt)

#mean/med/sd
ex_total_v <- as.vector(cronb_ex_total, mode = "any")
median(unlist(ex_total_v))
mean(unlist(ex_total_v))
sd(unlist(ex_total_v))
