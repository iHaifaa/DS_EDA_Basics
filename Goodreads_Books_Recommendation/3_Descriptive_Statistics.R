# Goodreads_Books 
# Descriptive Statistics
# Haifaa Alzahrani
# 21/10/2020

######################################################################################################################

# A brief discussion about the dataset

# The dataset has systematical error (bias):
# 1) Selection bias: 
# 2) Technology bias: 

######################################################################################################################

# Theoretical Probability Distribution

# empirical frequency distribution (on the sample = dataset)
# Empirical frequency distributions are distributions of a variable that we observe in a given sample.
# Just a Histogram ?

# years and number of rating?

# Does each one of the top 25 authors have similar average rating for different books?

# Does the awards correlated with popularity of the book?

# Which factor is much correlated with popularity of the book?

# Pages and rating counts?


# theoretical probability distributions
myColor = c("#8dd3c7",
            "#ffffb3",
            "#bebada",
            "#fb8072",
            "#80b1d3",
            "#fdb462",
            "#b3de69",
            "#fccde5",
            "#d9d9d9",
            "#bc80bd")
summary(dataset)

# Top 10 authors according to high rating count for their books
# OR Most popular authors
dataset %>%
  group_by(author) %>%
  summarise(rating_sum = sum(rating_count)) %>%
  arrange(-rating_sum)  %>%
  top_n(10)
NULL
ggplot(aes(reorder(author, -rating_sum), y = rating_sum, color = author)) +
  geom_col() + # add: names by 90 degree + e + colors 
  scale_color_brewer(palette = "Set3") +
  labs(title = "Most Popular Authors", 
       x ="The Author",
       y ="Number of Rating") +
  #coord_cartesian(ylim = c(1000000, 7000000)) +
  theme(aspect.ratio = 1)#, legend.position = c(0.1, 0.1)
