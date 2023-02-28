
# avg total checkouts for each genre



pop_genres_df <- spl_df %>% 
  filter(Subjects %in% c("Young Adult Fiction", "Romance", "Nonfiction", "Fantasy"))

avg_genre <- pop_genres_df %>% 
  group_by(Subjects) %>% 
  summarize(avg_subjects = mean(Checkouts, na.rm = TRUE))

fantasy_avg <- avg_genre %>% 
filter(Subjects == "Fantasy") %>% 
  pull(avg_subjects)

nonfiction_avg <- avg_genre %>% 
  filter(Subjects == "Nonfiction") %>% 
  pull(avg_subjects)

romance_avg <- avg_genre %>% 
  filter(Subjects == "Romance") %>% 
  pull(avg_subjects)

ya_fic_avg <- avg_genre %>% 
  filter(Subjects == "Young Adult Fiction") %>% 
  pull(avg_subjects)

# Date with the most checkouts of The Fault in Our Stars


fios_df<- spl_df %>% 
  filter(str_detect(Title, "the fault in our stars"))

fios_df <- fios_df %>% 
  mutate(date = paste0(CheckoutYear, "-", CheckoutMonth, "-01"))

fios_df$date <- as.Date(fios_df$date, format = "%Y-%m-%d")

most_checkouts_fios<- fios_df %>% 
  filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>% 
  pull(date)



# Create var for only SOA

bt_popularity <- spl_df %>% 
  filter(Title %in% c("they both die at the end", "the song of achilles", "we were liars"))

soa <- bt_popularity %>% 
  filter(Title == "the song of achilles")

#Total SOA checkouts per year

sum_soa <- soa %>% 
  group_by(CheckoutYear) %>% 
  summarize(total = sum(Checkouts))

#Year with most checkouts of Song of Achilles
most_soa <- sum_soa %>% 
  filter(total== max(total, na.rm = TRUE)) %>% 
  pull(CheckoutYear)




#Year with least checkouts of SOA
least_soa <- sum_soa %>% 
  filter(total == min(total, na.rm = TRUE)) %>% 
  pull(CheckoutYear)



#avg number of checkouts of fios pre 2014

avg_pre <- fios_df %>% 
  filter(date < "2014-06-01") %>% 
  summarize(pre_avg = mean(Checkouts, na.rm = TRUE))


# avg number of checkouts fios between 2014 and 2016

avg_post <- fios_df %>% 
  filter(date > "2014-06-01" & date < "2017-01-01") %>% 
  summarize(post_avg = mean(Checkouts, na.rm = TRUE))



```