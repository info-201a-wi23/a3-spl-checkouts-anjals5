
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



#summarize total checkouts per month 
total_checkouts <- fios_total %>% 
  group_by(date) %>% 
  summarize(total = sum(Checkouts))

film_release <- fios_df %>% 
  filter(date == "2014-06-01") %>% 
  pull(date)




ggplot(data = total_checkouts) +
  geom_line(aes( x = date, y = total)) +
  labs(title = "Number of 'The Fault in Our Stars' Checkouts Seperated by Before and After Film Release", y = "Total Number of Checkouts") +
geom_vline(xintercept = film_release, color = "blue")




