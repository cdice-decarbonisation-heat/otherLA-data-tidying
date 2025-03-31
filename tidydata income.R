## Tidy the ASHE data 

raw_income_df <- 'data/raw/ashe income.csv' %>% read_csv(skip = 8)
region_lkup_df <- 'data/note solar together region lookup (checked).csv' %>% read_csv

## rename for transparency 

income_df <-
    raw_income_df %>%
    transmute(
        ua_name = [xx],
        ua_code = [xx]. 
        `2015` = ,
        `2016` = ,
        `2017` = ,
        `2018` = ,
        `2019` = ,
        `2020` = ,
        `2021` = ,
        `2022` = ,
        `2023` = ,
        `2024` = 
    )

## get rid of awkard cols -- subset to England 
income_df <- 
    income_df %>% 
    mutate(
        ua_name = ua_name %>% tolower,
        ua_code = ua_code %>% tolower
    ) %>%
    filter(
        substr(1,1, ua_code) == 'e'  # code for England 
    )

## ua check the names 

## is everything there?
region_lkup_df %>% 
    filter(mcs_name %in% income_df$ua_name)

## Turn to long format -- UA by name 
income_df <- 
    income_df %>% 
    pivot_longer(
        cols = `2015`:`2024`,
        names_to = 'year',
        values_to = 'wkly_income'
    )

## save the outputs 
income_df %>% write_csv('data/tidydata income by year.csv') 