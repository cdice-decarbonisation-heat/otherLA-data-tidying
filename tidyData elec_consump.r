# tidyData elec_consump

## needs to read an xlsx file 
## from excel cheat sheet
# https://github.com/rstudio/cheatsheets/blob/main/data-import.pdf


elec_consump_sheet <-
    c(
        '2015',
        '2016',
        '2017',
        '2018',
        '2019',
        '2020',
        '2021',
        '2022',
        '2023'
    )

raw_elec_consump_list <- 
    elec_consump_sheet %>%
    set_names() %>%
    map(
        readxl::read_excel,
        path = 'data/raw/Subnational_electricity_consumption_statistics_2005-2023.xlsx',
        skip = 4
    )

## load in the region data 
region_lkup_df <- 'data/note solar together region lookup (checked).csv' %>% read_csv


## rename for transparency -----------------------
## data is across multiple dfs so easiest way is to process via function
raw_elec_consump_list[[1]] %>% names()

my_clean_elec_consump <- 
    function(x){
#      names(x) <- names(x) %>% gsub(x = ., '\r', '') # take out line breaks 
      
        names(x) <- names(x) %>% gsub(x = ., '\r\n', ' ') # take out line breaks 
        x <- x %>%
        transmute(
        ua_name = `Local authority`,
        ua_code = `Code`,
#        elec_consump_type = `LA ELEC_CONSUMP Sector`,
#        year = `Calendar Year`, 
        elec_consump = `Mean domestic consumption (kWh per household)`
        )
        
        return(x)
    }

# test
raw_elec_consump_list[[1]] %>% my_clean_elec_consump()

elec_consump_df <-
    raw_elec_consump_list %>% 
    map(my_clean_elec_consump) %>%
    bind_rows(.id = 'year')


# C02 is the one with a continuous time series

## get rid of awkard cols -- subset to England 
elec_consump_df <- 
    elec_consump_df %>% 
    mutate(
        ua_name = ua_name %>% tolower,
        ua_code = ua_code %>% tolower
    ) %>%
    filter(
        substr(x = ua_code, 1, 1) == 'e'  # code for England 
    )

## ua check the names 

## is everything there?
checkQA <- region_lkup_df %>% 
    filter(
      !(tolower(mcs_name) %in% elec_consump_df$ua_name  )
    )

checkQA

## everything is there! mcs name is the linking variable


## save the outputs 
elec_consump_df %>% write_csv('data/tidydata elec_consump by year.csv') 


