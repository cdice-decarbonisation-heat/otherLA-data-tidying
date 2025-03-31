# tidydata collate everything.R

ghg_df <- read_csv('data/tidydata ghg by year.csv') 
unemployed_df <- read_csv('data/tidydata unemployed by year.csv') 
elec_consump_df <- read_csv('data/tidydata elec_consump by year.csv')

ghg_df %>% summary
unemployed_df %>% summary
elec_consump_df %>% summary
## save all and data check 

all_df <- 
  unemployed_df %>% 
    left_join(ghg_df) %>% 
    left_join(elec_consump_df)

summary(all_df)

all_df %>% write_csv('data/tidydata ua stats by year.csv')