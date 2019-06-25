## IMD lookup

This function can be used when creating a new column to look for scores, ranks or deciles from any of the 10 indicies of deprivation. These indicies were last updated in 2015.

The function takes three parameters:

### Postcode
Accepts any full length postcode registered in England and Wales. Postcodes can be in either "XXX XXX" or "XXXXXX" format.
If this parameter is left blank or an invalid postcode is provided (including postcodes that have been created since the 2015 IMD was published) the function will return *null*

### Domain
This is the IMD domain that you want to lookup a value from and is selected using one of the following keywords:

Keyword | Description
--- | ---
IMD | The overall Index of Multiple Deprivation
INCOME | Income Deprivation Domain
EMPLOYMENT | Employment Deprivation Domain
EDUCATION | Education, Skills and Training Domain
HEALTH | Health Deprivation and Disability Domain
CRIME | Crime Domain
HOUSING | Barriers to Housing and Services Domain
LIVING | Living Environment Deprivation Domain
IDACI | Income Deprivation Affecting Children Index
IDAOPI | Income Deprivation Affecting Older People Index

If this parameter is left blank, or the keyword is misspelt the function will default to *IDACI*

### Measure
This is the measure you want to retrieve for your chosen domain and is selected using one of the following keywords:

Keyword | Description
--- | ---
DECILE | The Decile in which postcode can be found in the chosen domain (1: 10% most deprived; 10: 10% least deprived)
RANK | The Rank of a postcode in the chosen domain (1: most deprived; 32,844: least deprived)
SCORE | The Score of a postcode in the chosen domain

If this parameter is left blank, or the keyword is misspelt the function will default to *RANK*
