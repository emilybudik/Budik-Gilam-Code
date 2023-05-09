# set working directory

setwd("C:/Users/emily_2vx2daj/OneDrive/Documents/Jinternship Work/R work/Practice/main-practice")


# load packages

library(tidyverse)
library(Hmisc)
library(psych)
library(data.table)
library(purrr)
library(dplyr)

#read dataset

df <- readxl::read_xlsx("data.xlsx", sheet = 1)
view(df)

df <- df %>% 
  select(-`Emotional Empathy Questionaire`)
view(df)

# read regression dataset

df_reg <- read_csv("data_regression.csv")
view(df_reg)
str(df_reg)

# create new variables

df_reg <- df_reg %>% 
  mutate(sex_desc = recode_factor(sex, "0" = "Male", "1" = "Female")) %>% 
  mutate(mani_desc = recode_factor(manipulation, "0" = "Polite", "1" = "Rude"))
view(df_reg)

# Number and type of interactions

#by manipultation variable

df_count <- df_reg %>% 
  group_by(mani_desc) %>% 
  summarise(N = n())
df_count

#by sex variable

filter_female <-  df_reg %>% 
  filter(sex_desc == "Female")
filter_female

# Number of and percentage of gender

# n by sex

df_gender <- df_reg %>% 
  group_by(sex_desc) %>% 
  summarise(number = n())

df_gender


# by manipulation and gender

df_female <- df_reg %>% 
  filter(sex_desc == "Female") %>% 
  group_by(mani_desc, sex_desc) %>% 
  summarise(number = n())

df_female

# percentage by manipulation

percent_female <- df_female$number/df_count$N 

df_female$percent = percent_female * 100    

view(df_female)

# Get mean and sd and min max for emotional empathy

df_vars <- df_reg %>% 
  group_by(mani_desc) %>% 
  summarise(n = n(),
            mean_emp = mean(empathy_raw_score), 
            sd_emp = sd(empathy_raw_score), 
            min_emp = min(empathy_raw_score), 
            max_emp = max(empathy_raw_score)) 

df_vars[c(2,1),]

# repeat for anagram, fluency, creativity, flexibility
#anagram score 
df_anag <- df_reg %>% 
  group_by(mani_desc) %>% 
  summarise(n = n(),
            mean_ana = mean(anagram_score), 
            sd_ana = sd(anagram_score), 
            min_ana = min(anagram_score), 
            max_ana = max(anagram_score))

df_anag[c(2,1),]

#fluency score
df_fluen <- df_reg %>% 
  group_by(mani_desc) %>% 
  summarise(n = n(),
            mean_flu = mean(brick_use_score), 
            sd_flu = sd(brick_use_score), 
            min_flu = min(brick_use_score), 
            max_flu = max(brick_use_score))

df_fluen[c(2,1),]

#flexibility score
df_flex <- df_reg %>% 
  group_by(mani_desc) %>% 
  summarise(n = n(),
            mean_flex = mean(brick_flexibility), 
            sd_flex = sd(brick_flexibility), 
            min_flex = min(brick_flexibility), 
            max_flex = max(brick_flexibility))

df_flex[c(2,1),]

#Creatvity score

df_creat <- df_reg %>% 
  group_by(mani_desc) %>% 
  summarise(n = n(),
            mean_cre = mean(brick_creativity), 
            sd_cre = sd(brick_creativity), 
            min_cre = min(brick_creativity), 
            max_cre = max(brick_creativity))

df_creat[c(2,1),]

#join the female data frame with the m/sd/min/max data frames

df_joined <- purrr::reduce(list(df_count, df_female, df_vars,df_anag,df_fluen, df_creat, df_flex), dplyr::left_join, by = 'mani_desc')

df_joined[c(2,1),]


write.csv(df_joined, "descriptives.csv")

# get the total statistics

describe(df_reg)

summary_stats <- describe(df_reg)
summary_stats

write_csv(summary_stats, "totals.csv")

# total N

total_N <- nrow(df_reg)


# total n female

total_female <- nrow(filter_female)

# mean  percent female

mean_percent_female <- mean(df_female$percent)
mean_percent_female     

# total means

mean_emp <- mean(df_reg$empathy_raw_score)
mean_ana <- mean(df_reg$anagram_score)
mean_fluen <- mean(df_reg$brick_use_score)
mean_creat <- mean(df_reg$brick_creativity)
mean_flex <- mean(df_reg$brick_flexibility)

# total sds 

sd_emp <- sd(df_reg$empathy_raw_score)
sd_ana <- sd(df_reg$anagram_score)
sd_fluen <- sd(df_reg$brick_use_score)
sd_creat <- sd(df_reg$brick_creativity)
sd_flex <- sd(df_reg$brick_flexibility)

# total min 

min_emp <- min(df_reg$empathy_raw_score)
min_ana <- min(df_reg$anagram_score)
min_fluen <- min(df_reg$brick_use_score)
min_creat <- min(df_reg$brick_creativity)
min_flex <- min(df_reg$brick_flexibility)

# total max 

max_emp <- max(df_reg$empathy_raw_score)
max_ana <- max(df_reg$anagram_score)
max_fluen <- max(df_reg$brick_use_score)
max_creat <- max(df_reg$brick_creativity)
max_flex <- max(df_reg$brick_flexibility)

####

sum_list <-  data.table("Total",
                        total_N,
                        total_female, 
                        mean_percent_female,
                        mean_emp,
                        sd_emp,
                        min_emp,
                        max_emp,
                        mean_ana,
                        sd_ana,
                        min_ana,
                        max_ana,
                        mean_fluen,
                        sd_fluen,
                        min_fluen,
                        max_fluen,
                        mean_creat,
                        sd_creat,
                        min_creat,
                        max_creat,
                        mean_flex,
                        sd_flex,
                        min_flex,
                        max_flex)

sum_list

df_joined_edit <- df_joined[ -c(3,6,11,16,21,26) ]
df_joined_edit
sum_list


sum_stats <- data.table(mani_desc = "Total", 
                        N = total_N,
                        number = total_female,
                        percent = mean_percent_female,
                        mean_emp = mean_emp,
                        sd_emp = sd_emp,
                        min_emp = min_emp,
                        max_emp = max_emp,
                        mean_ana = mean_ana,
                        sd_ana = sd_ana,
                        min_ana = min_ana,
                        max_ana = max_ana, 
                        mean_flu = mean_fluen,
                        sd_flu = sd_fluen,
                        min_flu = min_fluen,
                        max_flu = max_fluen,
                        mean_cre = mean_creat,
                        sd_cre = sd_creat, 
                        min_cre = min_creat,
                        max_cre = max_creat,
                        mean_flex = mean_flex,
                        sd_flex = sd_flex,
                        min_flex = min_flex,
                        max_flex = max_flex)
sum_stats

df_final <- rbind(df_joined_edit, sum_stats)
view(df_final[c(2,1,3),])
