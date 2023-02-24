
#Load Data from SPL
spl_df <- read.csv("~/Downloads/2013-2023-5-Checkouts-SPL.csv", stringsAsFactors = FALSE)


# Load libraries
library("dplyr")
library("stringr")
library("ggplot2")


# Filter for specific book titles
booktok_popularity <- spl_df %>% 
  filter(Title %in% c("They Both Die at the End", "The Song of Achilles", "We Were Liars", "my year of rest and relaxation"))

#Sum of checkouts for popular books
pop_checkouts_per_year <- booktok_popularity %>% 
  group_by(CheckoutYear, Title) %>% 
  summarize(total_check = sum(Checkouts, na.rm = TRUE))  


#create line plot
popular_plot <- ggplot(data = pop_checkouts_per_year) +
  geom_line(aes(x = CheckoutYear, y = total_check, color = Title)) +
  labs(title = "Popularity of Booktok
       Books Over Time", 
       x = "Year" , y = "Total Checkouts") +
  scale_x_continuous(limits = c(2015, 2022))
popular_plot

  
  