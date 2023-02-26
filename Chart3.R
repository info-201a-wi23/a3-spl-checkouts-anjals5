
#Load Data from SPL
spl_df <- read.csv("~/Downloads/2013-2023-5-Checkouts-SPL.csv", stringsAsFactors = FALSE)


# Load libraries
library("dplyr")
library("stringr")
library("ggplot2")


# Filter for specific book titles
fios_df<- spl_df %>% 
  filter(str_detect(Title, "The Fault in Our Stars"))


#Make new column with checkout month, checkout year, and default day value. Convert column to date value
fios_df <- fios_df %>% 
  mutate(date = paste0(CheckoutYear, "-", CheckoutMonth, "-01"))
fios_df$date <- as.Date(fios_df$date, format = "%Y-%m-%d")



# Create new column for pre and post movie

fios_total <- fios_df %>% 
mutate( movie = ifelse(date < "2014-06-01","Pre-Movie", "Post-Movie"))


#summarize total checkouts per month 
total_checkouts <- fios_total %>% 
  group_by(movie, date) %>% 
  summarize(total = sum(Checkouts))


ggplot(data = total_checkouts) +
  geom_line(aes( x = date, y = total, color = movie)) +
  labs(title = "Number of 'The Fault in Our Stars' Checkouts Before and After
  Movie Release", y = "Total Number of Checkouts")



