
#Load Data from SPL
spl_df <- read.csv("~/Downloads/2013-2023-5-Checkouts-SPL.csv", stringsAsFactors = FALSE)

# Load libraries
library("dplyr")
library("stringr")
library("ggplot2")

# filtering for specific genres
pop_genres_df <- spl_df %>% 
  filter(Subjects %in% c("Young Adult Fiction", "Romance", "Nonfiction"))

# sum of the total checkouts per year based on genre
checkouts_per_year <- pop_genres_df %>% 
  group_by(CheckoutYear, Subjects) %>% 
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE)) 

#create line plot
genre_plot <- ggplot(data = checkouts_per_year) +
  geom_line(aes(x = CheckoutYear, y = total_checkouts, color = Subjects)) +
  labs(title = "Romance and Young Adult Fiction
       Checkouts Over the Years", 
       x = "Year" , y = "Total Checkouts") +
  scale_x_continuous(limits = c(2015, 2023)) 

genre_plot
