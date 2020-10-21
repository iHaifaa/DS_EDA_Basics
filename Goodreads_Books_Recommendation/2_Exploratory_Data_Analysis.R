# Goodreads_Books 
# Exploratory Data Analysis (EDA)
# Haifaa Alzahrani
# 21/10/2020

######################################################################################################################

# Initialize packages ----

library(tidyverse)
library(dplyr)

######################################################################################################################

# Load data  ----

dataset <- read.csv("Goodreads_Books/Data/full_books.csv", encoding="UTF-8")
dataset <- as_tibble(dataset) #Enhanced dataframe

# Overview
glimpse(dataset)

# Remove X
dataset <- dataset %>%
  select(-X.1, -X)

######################################################################################################################

# The dataset's variables
tribble(
  ~"Variable", ~"Continuous/Numerical/Quantitave", ~"Categorical/Discrete/Qualitative/Factors",
  names(dataset)[1], "Ratio", "X",
  names(dataset)[2], "X", "Nominal",
  names(dataset)[3], "X", "Nominal",
  names(dataset)[4], "Ratio", "X",
  names(dataset)[5], "X", "Nominal",
  names(dataset)[6], "X", "Nominal",
  names(dataset)[7], "Ratio", "X",
  names(dataset)[8], "Ratio", "X",
  names(dataset)[9], "Ratio", "X",
  names(dataset)[10], "Ordinal", "X",
  names(dataset)[11], "X", "Nominal",
  names(dataset)[12], "X", "Nominal",
  names(dataset)[13], "X", "Nominal"
)

######################################################################################################################

# Exploratory Data Analysis (EDA) ----

# Th most 25 popular authors according to rating count for their books
dataset %>%
  group_by(authors) %>%
  summarise(rating_sum = sum(ratings_count)) %>%
  arrange(-rating_sum)  %>%
  top_n(25)

# The books that got the highest 25 number ratings 
# To learn the most popular books
dataset %>%
  group_by(title) %>%
  arrange(-ratings_count) %>%
  top_n(25)  %>%
  select(title, authors, ratings_count, average_rating)

# The books that got the highest 25 count of reviews 
# To know which books motivate readers to discuss about them 
dataset %>%
  group_by(title) %>%
  arrange(-text_reviews_count) %>%
  top_n(25)  %>%
  select(title, authors, text_reviews_count, average_rating)

# Popular books that got the highest 25 ratings
# To know the most favorite books
dataset %>%
  group_by(title) %>%
  arrange(-average_rating) %>%
  top_n(25)  %>%
  select(title, authors, average_rating)

# Top 25 years according to the number of the published books
dataset %>%
  group_by(publication_date) %>%
  summarise(rating_sum = sum(ratings_count)) %>%
  arrange(-rating_sum) %>%
  top_n(25)