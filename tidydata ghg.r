# tidyData ghg
## Tidy the ASHE data 

raw_ghg_df <- 
    'data/raw/2005-2022-local-authority-ghg-emissions-csv-dataset.csv' %>% read_csv()
region_lkup_df <- 'data/note solar together region lookup (checked).csv' %>% read_csv
## rename for transparency 
## data is already longform

ghg_df <-
    raw_ghg_df %>%
    transmute(
        country = Country %>% tolower,
        ua_name = `Local Authority`,
        ua_code = `Local Authority Code`,
        ghg_type = `LA GHG Sector`,
        year = `Calendar Year`, 
        ghg_emission = `CO2 emissions within the scope of influence of LAs (kt CO2)` ## take this stat ## within scope of LA
    )
# C02 is the one with a continuous time series

## get rid of awkard cols -- subset to England 
ghg_df <- 
    ghg_df %>% 
    mutate(
        ua_name = ua_name %>% tolower,
        ua_code = ua_code %>% tolower
    ) %>%
    filter(
        country == 'england'  # code for England 
    )

## ua check the names 

## is everything there?
checkQA <- region_lkup_df %>% 
    filter(
      !(tolower(mcs_name) %in% ghg_df$ua_name  )
    )

checkQA

## everything is there! mcs name is the linking variable


### data is already in long-form but we need to aggregate
## Turn to long format -- UA by name 
ghg_df <- 
    ghg_df %>% 
    group_by(ua_name, ua_code, year) %>%
    summarise(
        ghg_emission = sum(ghg_emission, na.rm = T)
    )

## save the outputs 
ghg_df %>% write_csv('data/tidydata ghg by year.csv') 


