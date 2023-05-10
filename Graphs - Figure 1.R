#setwd

setwd("C:/Users/emily_2vx2daj/OneDrive/Documents/Jinternship Work/R work/Practice/main-practice")


# load packages

library(tidyverse)
library(data.table)

# read regression dataset

df_reg <- read_csv("data_regression.csv")
df_reg
str(df_reg)

# create new variables

df_reg <- df_reg %>% 
  mutate(sex_desc = recode_factor(sex, "0" = "Male", "1" = "Female")) %>% 
  mutate(mani_desc = recode_factor(manipulation, "0" = "Polite", "1" = "Rude"))
view(df_reg)

## Plotting the Data

colnames(df_reg)

#A- emotional empathy x anagram score
emp_ana_plot <- ggplot(df_reg, aes(empathy_raw_score, anagram_score, color = mani_desc))

emp_ana_plot + geom_point() +
  theme_classic() + geom_smooth(method=lm, se = FALSE) +
  scale_color_manual(values=c('Blue','Red')) +
  scale_x_continuous(name="Emotional Empathy", 
                     breaks = seq(-20, 100, by = 40)) +
  scale_y_continuous(name="# Anagrams Solved", 
                     breaks = seq(0, 10, by = 2)) +
  labs (title = "p = 0.084",
        subtitle = "A")
        
#B- emotional empathy x fluency 
emp_flu_plot <- ggplot(df_reg, aes(empathy_raw_score, brick_use_score, color = mani_desc))

emp_flu_plot +geom_point() +
  theme_classic() +geom_smooth(method=lm, se = FALSE) +
  scale_color_manual(values=c('Blue','Red')) +
  scale_x_continuous(name="Emotional Empathy", 
                     breaks = seq(-20, 100, by = 40)) +
  scale_y_continuous(name="Fluency", 
                     breaks = seq(0, 10, by = 2)) +
  labs (title = "p = 0.011",
        subtitle = "B")
  
#C - emotional empathy x creativity
emp_create_plot <- ggplot(df_reg, aes(empathy_raw_score, brick_creativity, color = mani_desc))

emp_create_plot + geom_point() +
  theme_classic() + geom_smooth(method=lm, se = FALSE)+
  scale_color_manual(values = c('Blue','Red')) +
  scale_x_continuous(name="Emotional Empathy", 
                     breaks = seq(-20, 100, by = 40)) +
  scale_y_continuous(name="Creativity", 
                     breaks = seq(0, 6, by = 1)) +
  labs (title = "p = 0.002",
        subtitle = "C",
        x = "Emotional Empathy",
        y = "Creativity")

#D - emotional empathy x flexibility
emp_flex_plot <- ggplot(df_reg, aes(empathy_raw_score, brick_flexibility, color = mani_desc))

emp_flex_plot +geom_point() +
  theme_classic() +geom_smooth(method=lm, se = FALSE)+                   scale_color_manual(values=c('Blue','Red')) +
  scale_x_continuous(name="Emotional Empathy", 
                     breaks = seq(-20, 100, by = 40)) +
  scale_y_continuous(name="Flexibility", 
                     breaks = seq(0, 6, by = 1)) +
  labs (title = "p = 0.004",
        subtitle = "D",
        x = "Emotional Empathy",
        y = "Flexibility")
