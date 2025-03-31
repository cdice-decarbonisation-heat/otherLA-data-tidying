# otherLA-data-tidying

Folder structure 

# Data sources 
(cross off when done)
processed to UA x month (or year) level 


    - [ ] ASHE income: 
        - https://www.nomisweb.co.uk/query/construct/submit.asp?menuOpt=201&fmt=xls&lr=geography&lc=date&fn=
        - tons missing  
    - [x] GHG: https://www.gov.uk/government/statistics/uk-local-authority-and-regional-greenhouse-gas-emissions-statistics-2005-to-2022
        - CO2 emissions within the scope of influence of LAs (kt CO2)
        - all done with no issues

    - Electricity consumption: https://www.gov.uk/government/statistics/regional-and-local-authority-electricity-consumption-statistics
    - Unemployment (https://www.nomisweb.co.uk/query/construct/submit.asp?menuopt=201&subcomp=) 
        ○ Source annual population study
    - Solar radiation: tool is here : https://joint-research-centre.ec.europa.eu/photovoltaic-geographical-information-system-pvgis_en 
        ○ However querying the API would be difficult 
    - New builds : https://www.gov.uk/government/statistical-data-sets/live-tables-on-net-supply-of-housing
Table 123


`/data`: cleaned data goes in this main folder
- `/data/raw` raw data to be processed 

Files:
- `note solar together region lookup....` is the file of UA names that we can to join