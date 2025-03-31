## Tidy the ASHE data 

raw_income_df <- 'data/raw/ashe income.csv' %>% read_csv(skip = 8)
region_lkup_df <- 'data/note solar together region lookup (checked).csv' %>% read_csv

## rename for transparency 

income_df <-
    raw_income_df %>%
    transmute(
        ua_name = `local authority: county / unitary (as of April 2021)`,
        ua_code = mnemonic, 
        `2015` = `2015`,
        `2016` = `2016`,
        `2017` = `2017`,
        `2018` = `2018`,
        `2019` = `2019`,
        `2020` = `2020`,
        `2021` = `2021`,
        `2022` = `2022`,
        `2023` = `2023`,
        `2024` = `2024`
    )
income_df
## get rid of awkard cols -- subset to England 
income_df <- 
    income_df %>% 
    mutate(
        ua_name = ua_name %>% tolower,
        ua_code = ua_code %>% tolower
    ) %>%
    filter(
        substr(1,1, x = ua_code) == 'e'  # code for England 
    )

    income_df$ua_code %>% substr(1,1)
## ua check the names 

## is everything there?
checkQA <- region_lkup_df %>% 
    filter(
      !(tolower(mcs_name) %in% income_df$ua_name  )
    )

checkQA

## 100 or so??? need to check why 

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

