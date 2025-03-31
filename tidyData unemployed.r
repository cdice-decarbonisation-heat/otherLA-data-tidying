# tidyData unemployed
## Tidy the ASHE data 

raw_unemployed_df <- 
    'data/raw/ons modelled unemployment.csv' %>%
    read_csv(skip = 7)


region_lkup_df <- 
    'data/note solar together region lookup (checked).csv' %>% 
    read_csv

## rename for transparency 
## data is already longform
raw_unemployed_df

unemployed_df <-
    raw_unemployed_df %>%
    transmute(
#        year_time_temp = time,
        ua_name = `local authority: district / unitary (as of April 2021)`,
        ua_code = mnemonic,
        `2015` = `Oct 2014-Sep 2015`,
        `2016` = `Oct 2015-Sep 2016`,
        `2017` = `Oct 2016-Sep 2017`,
        `2018` = `Oct 2017-Sep 2018`,
        `2019` = `Oct 2018-Sep 2019`,
        `2020` = `Oct 2019-Sep 2020`,
        `2021` = `Oct 2020-Sep 2021`,
        `2022` = `Oct 2021-Sep 2022`,
        `2023` = `Oct 2022-Sep 2023`,
        `2024` = `Oct 2023-Sep 2024`

    )



## get rid of awkard cols 
unemployed_df <- 
    unemployed_df %>% 
    mutate(
        ua_name = ua_name %>% tolower,
        ua_code = ua_code %>% tolower
    ) %>%
    filter(
        substr(1,1, x = ua_code) == 'e'  # code for England 
    )

## ua check the names 

## is everything there? -----------------------
checkQA <- region_lkup_df %>% 
    filter(
      !(tolower(mcs_name) %in% unemployed_df$ua_name  )
    )

checkQA %>% select(region, ua_name)
## everything is there! mcs name is the linking variable

## Turn to long format -- UA by name ---------
unemployed_df <- 
    unemployed_df %>% 
    pivot_longer(
        cols = `2015`:`2024`,
        names_to = 'year',
        values_to = 'unemployment_rate'
    )



## save the outputs 
unemployed_df %>% write_csv('data/tidydata unemployed by year.csv') 


