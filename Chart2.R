
#Load Data from SPL
spl_df <- read.csv("~/Downloads/2013-2023-5-Checkouts-SPL.csv", stringsAsFactors = FALSE)
spl_df$Title <- tolower(spl_df$Title)

# Load libraries
library("dplyr")
library("stringr")
library("ggplot2")


# Filter for specific book titles
bt_popularity <- spl_df %>% 
  filter(Title %in% c("they both die at the end", "the song of achilles", "we were liars"))



#Sum of checkouts for popular books
pop_checkouts_per_year <- bt_popularity %>% 
  group_by(CheckoutYear, Title) %>% 
  summarize(total_check = sum(Checkouts, na.rm = TRUE))  


#create line plot
ggplot(data = pop_checkouts_per_year) +
  geom_line(aes(x = CheckoutYear, y = total_check, color = Title)) +
  labs(title = "Popularity of Booktok eBooks Over Time", 
       x = "Year" , y = "Total eBook Checkouts") +
  scale_x_continuous(limits = c(2015, 2022))
 
  
  