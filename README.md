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

    - [x] Electricity consumption: https://www.gov.uk/government/statistics/regional-and-local-authority-electricity-consumption-statistics
        - done we use mean electricity consumption per HH in a LA -- simple aggregation by region (note limitations)

    - [x] Unemployment (https://www.nomisweb.co.uk/query/construct/submit.asp?menuopt=201&subcomp=) 
        ○ Source annual population study -- modelled unemployment

```
        This dataset gives the official unemployment figures for local authorities. Model-based estimates are only available for total unemployed; they are not produced for male or female unemployed. Official unemployment figures for other geographies have been included in this dataset for comparison purposes. Estimates for these areas are not model-based and have been taken directly from the Annual Population Survey dataset.
        Background: As unemployed form a small percentage of the population, the Annual Population Survey (APS) unemployed estimates within local authorities are based on very small samples so for many areas are unreliable. To overcome this model-based estimates have been developed that provide better estimates of total unemployed for local authorities.
        Methodology: The model-based estimate improves on the APS estimate by borrowing strength from the claimant count to produce an estimate that is more precise i.e. has a smaller confidence interval. The claimant count is not itself a measure of unemployment but is strongly correlated with unemployment, and, as it is an administrative count, is known without sampling error. The gain in precision is greatest for areas with smaller sample sizes.
        Refer to the user guide (pdf) for further details.
        
        From <https://www.nomisweb.co.uk/query/construct/summary.asp?mode=construct&version=0&dataset=127> 
https://www.nomisweb.co.uk/query/construct/summary.asp?mode=construct&version=0&dataset=127
```

    - New builds : https://www.gov.uk/government/statistical-data-sets/live-tables-on-net-supply-of-housing
Table 123


`/data`: cleaned data goes in this main folder
- `/data/raw` raw data to be processed 

Files:
- `note solar together region lookup....` is the file of UA names that we can to join