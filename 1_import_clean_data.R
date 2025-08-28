##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
##----------- DATA MANAGMENT - DOWNLOAD, CLEAN, AND FILTER DATA ----------------
##                                                                            --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Before performing the tasks, you must downloaded the 4 csvs from the EDI Data Portal: QuebradaCuenca1-Bisley, QuebradaCuenca2-Bisley, QuebradaCuenca3-Bisley, and RioMameyesPuenteRoto. 

# LINK to download raw data from EDI Data Portal: <https://portal.edirepository.org/nis/mapbrowse?packageid=knb-lter-luq.20.4923064>



#                     Load libraries                         ~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
library(here)
library(janitor)
library(tidyverse)
library(tidyr)
library(skimr)
library(dplyr)


#                   Load Data into Script                    ~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
BQ1_data <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv"), na = c("NA"))
BQ2_data <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv"), na = c("NA"))
BQ3_data <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv"), na = c("NA"))
PRM_data <- read_csv(here("data", "RioMameyesPuenteRoto.csv"), , na = c("NA"))



#    Cleaning and filtering each data set for necessarily columns       ~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# To create the time series plot, the Sample_ID, Sample_Date, concentrations of NO3-N, K, Mg, Ca, NH4-N are necessary 
BQ1_data <- BQ1_data %>% 
  select("Sample_ID", "Sample_Date", "NO3-N", "K", "Mg", "Ca", "NH4-N") %>% 
  clean_names() # changes all the column names to follow the same syntax

BQ2_data <- BQ2_data %>% 
  select("Sample_ID", "Sample_Date", "NO3-N", "K", "Mg", "Ca", "NH4-N") %>% 
  clean_names()

BQ3_data <- BQ3_data %>% 
  select("Sample_ID", "Sample_Date", "NO3-N", "K", "Mg", "Ca", "NH4-N") %>% 
  clean_names()

PRM_data <- PRM_data %>% 
  select("Sample_ID", "Sample_Date", "NO3-N", "K", "Mg", "Ca", "NH4-N") %>% 
  clean_names()

