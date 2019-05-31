# PowerQuery for Department for Education data sources

This repository contains PowerQuery scripts for connecting to various publicly available Department for Education datasets. The author accepts no liability for their use and cannot guarantee they will continue to work should the Department for Education make changes to either of it's publicly available data systems.

PowerQuery can be used in both PowerBI and Excel to connect to and manipulate data sources. Using PowerQuery to connect to and shape a dataset can remove the need for the same processes to be applied manually when the data source is updated.

Thanks goes to [Scott (@fusionet24)](https://twitter.com/fusionet24) for his work on a similar project in R which inspired these scripts, to the EduData community for their insight and to the Department for Education for making these datasets readily available to datanauts like us.

## GIAS Data

This script gets the most up to date snapshot of information stored on Get Information About Schools. Snapshots are accessed using a combination of year, month and day values. This script polls the system it's running on for current data information to ensure the most recent snapshot is accessed.

## PerformanceTables Data

This script gets the most up to date snapshot of information stored in the Compare School Performance Tables. Whereas the GIAS service provides a single dataset of basic details on every school, the Performance Tables have a variety of different datasets available.

By default the script downloads the Spring Census summary data for the most recently published Performance Tables. Changing the CENSUS keyword for one of those listed below will download a different dataset:

  Keyword | Description
  --- | ---
  SPINE | Spine (general school information)
  KS2 | Final Key Stage 2 headline results
  KS4 | Final Key Stage 4 headline results
  KS4PROV | Provisional Key Stage 4 headline results
  KS4UNDERLYING | Key Stage 4 qualification and subject level data
  KS5 | Final Key Stage 5 headline results
  KS5UNDERLYING | Key Stage 5 qualification and subject level data  
  VAQUAL | Key Stage 5 value added qualification level data
  VASUBJ | Key Stage 5 value added subject level data 
  KS5APPR | Apprenticeships data
  KS5MATHSCI | Key Stage 5 Maths and Science A levels
  KS4DESTINATION | Key Stage 4 destinations data
  KS5DESTINATION | Key Stage 5 destinations data
  PUPDESTPROV | Provisional Key Stage 4 destinations data
  PUPILABSENCE | Pupil absence data
  CENSUS | Census (details about pupil types) *- downloaded by default*
  WORKFORCE | School workforce data
  SPENDPERPUPIL | Spend per pupil
  SPENDPERPUPILGROUPED | Spend per pupil grouped data
  SPENDPERPUPILFULL | Spend per pupil full dataset
  KS2MATS | Key Stage 2 Multi-academy trust data
  KS4MATS | Key Stage 4 Multi-academy trust data
  KS5MATS | Key Stage 5 Multi-academy trust data
  

Like the GIAS Data script, this script accesses snapshots using a combination of date information. In this case the starting and ending years of an academic year separated by a "-". 

Unlike the GIAS dataset, different parts of the Performance Tables are released at different times. To ensure the most up to date information is captured the script will look for datasets linked to the previous academic year first. If no data is yet available for the previous year, the script will collect the most recent available dataset.


