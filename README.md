# PowerQuery for Department for Education data sources

This repository contains PowerQuery scripts for connecting to various publicly available Department for Education datasets. The author accepts no liability for their use and cannot guarantee they will continue to work should the Department for Education make changes to either of it's publicly available data systems.

PowerQuery can be used in both PowerBI and Excel to connect to and manipulate data sources. Using PowerQuery to connect to and shape a dataset can remove the need for the same processes to be applied manually when the data source is updated.

Thanks goes to [Scott (@fusionet24)](https://twitter.com/fusionet24) for his work on a similar project in R which inspired these scripts, to the EduData community for their insight and to the Department for Education for making these datasets readily available to datanauts like us.

## GIAS Data

This script gets the most up to date snapshot of information stored on Get Information About Schools. Snapshots are accessed using a combination of year, month and day values. This script polls the system it's running on for current data information to ensure the most recent snapshot is accessed.

## PerformanceTables Data

This script gets the most up to date snapshot of information stored in the Compare School Performance Tables. Whereas the GIAS data is a single snapshot of all instituation's basic details, the sources of information available via the Performance Tables include:

  * General school information
  * Spring census summary
  * Pupil absences
  * Exclusions
  * Workforce summary
  * Spend per pupil
  * Inspection outcomes
  * Destinations data
  * Attainment and Progress data
  * Multi-academy Trust information

Each of these datasets is accessed by changing the filter parameter in the URL. A list of valid filter parameters will follow soon, for now the script downloads the Spring Census summary data for the most recently published Performance Tables.

Like the GIAS Data script, this script accesses snapshots using a combination of date information. In this case the starting and ending years of an academic year separated by a "-". 

Unlike the GIAS dataset, different parts of the Performance Tables are released at different times. To ensure the most up to date information is captured the script will look for datasets linked to the previous academic year first. If no data is yet available for the previous year, the script will collect data from two years previous.


